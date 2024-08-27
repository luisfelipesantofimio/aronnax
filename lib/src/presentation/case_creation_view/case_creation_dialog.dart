import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:aronnax/src/presentation/case_creation_view/case_creation_form.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CaseCreationDialog extends ConsumerStatefulWidget {
  const CaseCreationDialog({super.key, required this.patientData});
  final Patient patientData;

  @override
  ConsumerState<CaseCreationDialog> createState() => _CaseCreationDialogState();
}

class _CaseCreationDialogState extends ConsumerState<CaseCreationDialog> {
  bool treatmentPlanActivated = false;
  @override
  void initState() {
    ref.read(caseFormTreatmentPlanProvider.notifier).update((state) => null);
    ref.read(caseFormCaseNotesProvider.notifier).update((state) => null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final treatmentPlanList = ref.watch(
      treatmentPlanListProvider(ref.watch(offlineStatusProvider).value!),
    );

    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.45,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                AppLocalizations.of(context)!.caseCreationTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              const CaseCreationForm(),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                children: [
                  Switch(
                    value: treatmentPlanActivated,
                    onChanged: (value) {
                      setState(() {
                        treatmentPlanActivated = !treatmentPlanActivated;
                      });
                      if (!treatmentPlanActivated) {
                        ref
                            .read(caseFormTreatmentPlanProvider.notifier)
                            .update((state) => null);
                      }
                    },
                  ),
                  Text(
                    treatmentPlanActivated
                        ? AppLocalizations.of(context)!
                            .caseCreationWithTreatment
                        : AppLocalizations.of(context)!
                            .caseCreationWithoutTreatment,
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Visibility(
                visible: treatmentPlanActivated,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.caseCreationFormTitleAdd,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    treatmentPlanList.when(
                      data: (data) => DropdownButtonFormField(
                        hint: Text(
                          AppLocalizations.of(context)!
                              .caseCreationFormSelectTreatment,
                        ),
                        items: data
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.title),
                              ),
                            )
                            .toList(),
                        onChanged: (TreatmentPlan? value) {
                          ref
                              .read(caseFormTreatmentPlanProvider.notifier)
                              .update((state) => value);
                        },
                      ),
                      error: (error, stackTrace) => Text(
                          AppLocalizations.of(context)!.genericErrorMessage),
                      loading: () => const CircularProgressIndicator(),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              GenericMinimalButton(
                title: AppLocalizations.of(context)!.genericSaveTitle,
                onTap: () {
                  if (caseCreationFormKey.currentState!.validate()) {
                    // TODO: Review if something changed
                    ref.read(patientsRepositoryProvider).addPatientCase(
                        ref,
                        DateTime.now(),
                        widget.patientData.id,
                        ref.read(globalUserInformationProvider)!.id,
                        ref.read(caseFormConsultationReasonProvider)!,
                        ref.read(caseFormTreatmentProposalProvider)!,
                        ref.read(caseFormDiagnosticProvider)!,
                        ref.read(caseFormDiagnosticCodeProvider),
                        ref.read(caseFormCaseNotesProvider),
                        ref.read(caseFormTreatmentPlanProvider)?.id,
                        ref
                            .read(caseFormTreatmentPlanProvider)
                            ?.sectionsList
                            .indexOf(ref
                                .read(caseFormTreatmentPlanProvider)!
                                .sectionsList
                                .first),
                        ref.read(offlineStatusProvider).value!);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(AppLocalizations.of(context)!
                            .caseCreationFormSaveConfirmation),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
