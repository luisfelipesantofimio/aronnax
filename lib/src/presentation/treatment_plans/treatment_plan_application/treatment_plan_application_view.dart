import 'dart:developer';

import 'package:aronnax/src/data/interfaces/treatment_plans_repository_interface.dart';
import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/section.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/widgets/treatment_plan_build_widgets/section_list_element.dart';
import 'package:aronnax/src/presentation/widgets/treatment_plan_build_widgets/treatment_plan_list_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreatmentPlanApplicationView extends ConsumerStatefulWidget {
  const TreatmentPlanApplicationView({
    Key? key,
    required this.treatmentPlanData,
    required this.caseData,
  }) : super(key: key);
  final TreatmentPlan treatmentPlanData;
  final PatientCase caseData;

  @override
  ConsumerState<TreatmentPlanApplicationView> createState() =>
      _TreatmentPlanApplicationViewState();
}

class _TreatmentPlanApplicationViewState
    extends ConsumerState<TreatmentPlanApplicationView> {
  List<Section> sectionList = [];
  int selectedSectionIndex = 0;

  @override
  void initState() {
    treatmentPlanApplicationFormKey.currentState?.initState();
    Future(
      () {
        ref.read(currentTreatmentPlanResponseProvider.notifier).update(
              (state) => TreatmentPlanResult(
                applicationDate: DateTime.now(),
                sessionNumber: 0,
                patientId: widget.caseData.patientId,
                professionalId: widget.caseData.professionalId,
                treatmentPlanId: widget.treatmentPlanData.id,
                results: [],
              ),
            );
      },
    );
    setState(() {
      sectionList = widget.treatmentPlanData.sectionsList;
    });
    super.initState();
  }

  @override
  void dispose() {
    treatmentPlanApplicationFormKey.currentState?.dispose();

    ref
        .read(currentTreatmentPlanResponseProvider.notifier)
        .update((state) => null);
    ref
        .read(currentTreatmentPlanResponseListProvider.notifier)
        .update((state) => []);

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
              sectionList[selectedSectionIndex].components,
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
                  color: Color.fromARGB(255, 240, 239, 239),
                  width: constrains.maxWidth * 0.6,
                  child: Column(
                    children: [
                      SizedBox(
                        width: constrains.maxWidth * 0.8,
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sectionList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SectionListElement(
                                selectedItem: selectedSectionIndex == index,
                                editionComponent: false,
                                onEdit: () {},
                                onDelete: () {},
                                onTap: () {
                                  setState(() {
                                    selectedSectionIndex = index;
                                  });
                                },
                                sectionTitle: sectionList[index].name,
                                sectionDescription:
                                    sectionList[index].description ??
                                        'No description',
                              ),
                            ),
                          ),
                        ),
                      ),
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
                  child: Column(
                    children: [
                      Text(widget.treatmentPlanData.title),
                      Text(widget.treatmentPlanData.description),
                    ],
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
