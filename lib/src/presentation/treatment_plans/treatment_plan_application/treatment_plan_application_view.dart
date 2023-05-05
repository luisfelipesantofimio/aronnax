import 'dart:developer';

import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/treatment_plans_repository_interface.dart';
import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/section.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:aronnax/src/presentation/widgets/treatment_plan_build_widgets/treatment_plan_list_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreatmentPlanApplicationView extends ConsumerStatefulWidget {
  const TreatmentPlanApplicationView({
    Key? key,
    required this.treatmentPlanData,
    required this.caseData,
    required this.patientSessionAmount,
    required this.onResultsSaving,
  }) : super(key: key);
  final TreatmentPlan treatmentPlanData;
  final PatientCase caseData;
  final int patientSessionAmount;
  final Function(bool resultsSaved) onResultsSaving;

  @override
  ConsumerState<TreatmentPlanApplicationView> createState() =>
      _TreatmentPlanApplicationViewState();
}

class _TreatmentPlanApplicationViewState
    extends ConsumerState<TreatmentPlanApplicationView> {
  List<Section> sectionList = [];
  int currentTreatmentPhase = 0;

  @override
  void initState() {
    treatmentPlanApplicationFormKey.currentState?.initState();
    Future(() {
      ref
          .read(currentTreatmentPlanResponseProvider.notifier)
          .update((state) => null);
      ref.read(currentTreatmentPlanResponseListProvider).clear();
      ref.read(currentTreatmentPlanResponseProvider.notifier).update(
            (state) => TreatmentPlanResult(
              phaseNumber: widget.caseData.currentTreatmentPlanPhase!,
              applicationDate: DateTime.now(),
              sessionNumber: widget.patientSessionAmount + 1,
              patientId: widget.caseData.patientId,
              professionalId: widget.caseData.professionalId,
              treatmentPlanId: widget.treatmentPlanData.id,
              results: [],
            ),
          );
    });

    log(ref.read(currentTreatmentPlanResponseListProvider).toString());
    setState(() {
      sectionList = widget.treatmentPlanData.sectionsList;
      currentTreatmentPhase = widget.caseData.currentTreatmentPlanPhase!;
    });
    List<TreatmentPlanComponent> componentsList =
        widget.treatmentPlanData.sectionsList[currentTreatmentPhase].components;

    for (var element in componentsList) {
      ref.read(currentTreatmentPlanResponseListProvider.notifier).state.add(
            TreatmentPlanResultValue(
                componentTitle: element.componentTitle,
                componentType: element.componentType,
                componentId: element.id!,
                treatmentPhase: widget.caseData.currentTreatmentPlanPhase!,
                messurable: element.messurable,
                value: null),
          );
    }
    super.initState();
  }

  @override
  void dispose() {
    treatmentPlanApplicationFormKey.currentState?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(ref.read(currentTreatmentPlanResponseProvider).toString());
    final decodedComponents = ref.watch(
      treatmentPlanComponentDecoding(
        ref
            .read(treatmentPlanRepositoryProvider)
            .encodeTreatmentComponentPlanData(
              sectionList[widget.caseData.currentTreatmentPlanPhase!]
                  .components,
            ),
      ),
    );

    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: LayoutBuilder(
          builder: (context, constrains) {
            return Row(
              children: [
                Container(
                  color: const Color.fromARGB(255, 240, 239, 239),
                  width: constrains.maxWidth * 0.6,
                  child: Column(
                    children: [
                      SizedBox(
                        height: constrains.maxHeight * 0.8,
                        child: Form(
                          key: treatmentPlanApplicationFormKey,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: decodedComponents.length,
                            itemBuilder: (context, index) =>
                                TreatmentPlanListComponent(
                                    component: decodedComponents[index],
                                    onEdit: () {},
                                    onDelete: () {},
                                    onDuplicate: () {},
                                    editionComponent: false),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: constrains.maxWidth * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              child: Text(
                                widget.treatmentPlanData.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Text(widget.treatmentPlanData.description),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20),
                        ),
                        Row(
                          children: [
                            GenericMinimalButton(
                              title: 'Save session results',
                              onTap: () {
                                if (treatmentPlanApplicationFormKey
                                    .currentState!
                                    .validate()) {
                                  List<TreatmentPlanResultValue> resultsList =
                                      ref.read(
                                          currentTreatmentPlanResponseListProvider);
                                  TreatmentPlanResult result = ref
                                      .read(
                                          currentTreatmentPlanResponseProvider)!
                                      .copyWith(
                                        results: resultsList,
                                      );

                                  ref
                                      .read(treatmentPlanRepositoryProvider)
                                      .saveTreatmentPlanResults(
                                        ref,
                                        result,
                                        widget.caseData,
                                      );

                                  widget.onResultsSaving(true);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.green,
                                      content:
                                          Text('Saved treatment plan results!'),
                                    ),
                                  );
                                  Navigator.pop(context);
                                }
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            Visibility(
                              visible:
                                  widget.treatmentPlanData.sectionsList.length >
                                      1,
                              child: GenericMinimalButton(
                                title: 'Close current phase',
                                onTap: () {
                                  if (widget
                                          .caseData.currentTreatmentPlanPhase! <
                                      widget.treatmentPlanData.sectionsList
                                          .length) {
                                    ref
                                        .read(patientsRepositoryProvider)
                                        .updatePatientCaseCurrentPhase(
                                            ref,
                                            widget.caseData.id,
                                            widget.caseData
                                                    .currentTreatmentPlanPhase! +
                                                1);

                                    setState(() {
                                      currentTreatmentPhase = widget.caseData
                                              .currentTreatmentPlanPhase! +
                                          1;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                            'Moved to the next treatment plan phase'),
                                      ),
                                    );
                                    //   Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.red,
                                        content:
                                            Text('There are no more phases'),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
