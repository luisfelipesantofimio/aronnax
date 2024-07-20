import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/patient_case_providers.dart';
import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/presentation/patient_case_view/dialogs/case_close_dialog.dart';
import 'package:aronnax/src/presentation/patient_case_view/dialogs/case_delete_dialog.dart';
import 'package:aronnax/src/presentation/patient_case_view/dialogs/case_outcome_visualization_dialog.dart';
import 'package:aronnax/src/presentation/patient_case_view/patient_sessions_list.dart';
import 'package:aronnax/src/presentation/widgets/results_visualization/results_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientCaseListElement extends ConsumerWidget {
  const PatientCaseListElement({
    super.key,
    required this.caseData,
    required this.elementIndex,
    required this.patientId,
    required this.isOffline,
  });

  final PatientCase caseData;
  final int elementIndex;
  final String patientId;
  final bool isOffline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treatmentPlansList = ref.watch(
      treatmentPlanListProvider(isOffline),
    );
    return LayoutBuilder(
      builder: (context, constrains) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 230, 230, 230),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: constrains.maxWidth * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.genericCase} #${elementIndex + 1}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .caseCreationFormHintConsultationReason,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(caseData.consultationReason),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(
                    AppLocalizations.of(context)!.genericDiagnostic,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(caseData.diagnostic),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Visibility(
                    visible: caseData.icdDiagnosticCode != null,
                    child: Row(
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.patientDataCaseDiagnosticCode}: ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(caseData.icdDiagnosticCode ?? ''),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .caseCreationFormTitleTreatmentProposotion,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(caseData.treatmentProposal),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Visibility(
                    visible: caseData.caseNotes != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.genericNotes,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(caseData.caseNotes ?? ''),
                      ],
                    ),
                  ),
                  treatmentPlansList.when(
                    data: (data) => caseData.treatmentPlanId != null
                        ? Row(
                            children: [
                              Text(
                                "${AppLocalizations.of(context)!.genericTreatmentPlan}: ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(data
                                  .elementAt(
                                    data.indexWhere((element) =>
                                        element.id == caseData.treatmentPlanId),
                                  )
                                  .title)
                            ],
                          )
                        : const SizedBox(),
                    error: (error, stackTrace) =>
                        Text(AppLocalizations.of(context)!.genericErrorMessage),
                    loading: () => const CircularProgressIndicator(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Visibility(
                            visible: caseData.treatmentPlanId != null,
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => ResultsDialog(
                                          patientId: patientId,
                                          caseData: caseData,
                                        ));
                              },
                              child: Text(
                                AppLocalizations.of(context)!
                                    .patientDataSeeResultsList,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => PatientSessionsList(
                                  caseId: caseData.id,
                                  patientId: patientId,
                                ),
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!
                                  .patientDataSeeSessions,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Visibility(
                            visible: !caseData.patientCaseClosed,
                            child: Text(caseData.isActive
                                ? AppLocalizations.of(context)!
                                    .patientCaseActiveCase
                                : AppLocalizations.of(context)!
                                    .patientCaseInactiveCase),
                          ),
                          Visibility(
                            visible: !caseData.patientCaseClosed,
                            child: Switch(
                              value: caseData.isActive,
                              onChanged: (value) {
                                ref
                                    .read(patientsRepositoryProvider)
                                    .updatePatientCaseActiveState(
                                        ref,
                                        patientId,
                                        caseData.id,
                                        caseData.isActive);
                                ref.invalidate(patientCaseListProvider);
                              },
                            ),
                          ),
                          IconButton(
                            tooltip: AppLocalizations.of(context)!
                                .patientCaseDeleteCase,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    CaseDeleteDialog(caseData: caseData),
                              );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                      caseData.patientCaseClosed
                          ? TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CaseOutcomeVisualizationDialog(
                                      caseData: caseData,
                                    );
                                  },
                                );
                              },
                              child: Text(
                                AppLocalizations.of(context)!
                                    .patientCaseSeeCaseOutcome,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CaseCloseDialog(caseData: caseData);
                                  },
                                );
                              },
                              child: Text(
                                AppLocalizations.of(context)!
                                    .patientCaseCloseDialogCloseButton,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
