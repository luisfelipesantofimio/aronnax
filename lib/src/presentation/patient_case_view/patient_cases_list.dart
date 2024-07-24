import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/patient_case_providers.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/presentation/case_creation_view/case_creation_dialog.dart';
import 'package:aronnax/src/presentation/widgets/patiens_widgets/patient_case_list_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientCasesListView extends ConsumerWidget {
  const PatientCasesListView({
    super.key,
    required this.patientData,
  });
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.patientDataCaseEmpty),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          CaseCreationDialog(patientData: patientData),
                    );
                    ref.invalidate(patientCaseListProvider);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.patientDataCaseCreateNew,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            )
          : ListView.builder(
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
      error: (error, stackTrace) =>
          Text('${AppLocalizations.of(context)!.genericErrorMessage}: $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
