import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/patient_case_providers.dart';
import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/presentation/patient_case_view/patient_sessions_list.dart';
import 'package:aronnax/src/presentation/widgets/results_visualization/results_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientCaseListElement extends ConsumerWidget {
  const PatientCaseListElement({
    Key? key,
    required this.caseData,
    required this.elementIndex,
    required this.patientId,
    required this.isOffline,
  }) : super(key: key);

  final PatientCase caseData;
  final int elementIndex;
  final int patientId;
  final bool isOffline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treatmentPlansList = ref.watch(
      treatmentPlanListProvider(isOffline),
    );
    return LayoutBuilder(
      builder: (p0, constrains) {
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
                      Text('Case #${elementIndex + 1}'),
                      const Row(
                        children: [],
                      ),
                    ],
                  ),
                  const Text('Consultation reason'),
                  Text(caseData.consultationReason),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  const Text('Diagnostic'),
                  Text(caseData.diagnostic),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  const Text('Treatment proposal'),
                  Text(caseData.treatmentProposal),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Visibility(
                    visible: caseData.caseNotes != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Notes'),
                        Text(caseData.caseNotes ?? ''),
                      ],
                    ),
                  ),
                  treatmentPlansList.when(
                    data: (data) => caseData.treatmentPlanId != null
                        ? Row(
                            children: [
                              const Text('Treatment plan: '),
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
                        const Text('Something went wrong'),
                    loading: () => const CircularProgressIndicator(),
                  ),
                  Row(
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
                              child: const Text(
                                'See results list',
                                style: TextStyle(
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
                            child: const Text(
                              'See sessions',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Text(caseData.isActive
                              ? 'Active case'
                              : 'Inactive case'),
                          Switch(
                            value: caseData.isActive,
                            onChanged: (value) {
                              ref
                                  .read(patientsRepositoryProvider)
                                  .updatePatientCaseActiveState(ref, patientId,
                                      caseData.id, caseData.isActive);
                              ref.invalidate(patientCaseListProvider);
                            },
                          )
                        ],
                      ),
                      IconButton(
                        tooltip: 'Delete case',
                        onPressed: () {
                          ref
                              .read(patientsRepositoryProvider)
                              .deletePatientCase(ref, caseData.id);
                          ref.invalidate(patientCaseListProvider);
                        },
                        icon: const Icon(Icons.delete),
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
