import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/patient_case_providers.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/presentation/case_creation_view/case_creation_dialog.dart';
import 'package:aronnax/src/presentation/widgets/patiens_widgets/patient_case_list_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientCasesListView extends ConsumerWidget {
  const PatientCasesListView({
    Key? key,
    required this.patientData,
  }) : super(key: key);
  final Patient patientData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final casesList = ref.watch(
      patientCaseListProvider(patientData.id),
    );
    final isOffline = ref.watch(offlineStatusProvider);
    return casesList.when(
      data: (data) => data.isEmpty
          ? Column(
              children: [
                const Text('This user has no open cases'),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          CaseCreationDialog(patientData: patientData),
                    );
                    ref.invalidate(patientCaseListProvider);
                  },
                  child: const Text(
                    'Create new case',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            )
          : Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: PatientCaseListElement(
                    caseData: data[index],
                    elementIndex: index,
                    patientId: patientData.id,
                    isOffline: isOffline.value!,
                  ),
                ),
              ),
            ),
      error: (error, stackTrace) => Text('Something went wrong: $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
