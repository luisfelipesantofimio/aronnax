import 'package:aronnax/src/data/providers/clinic_history_data_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClinicHistoryDetailView extends ConsumerWidget {
  const ClinicHistoryDetailView({super.key, required this.patientData});
  final Patient patientData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clinicHistoryData = ref.watch(
      clinicHistoryByIdProvider(patientData.id),
    );

    return clinicHistoryData.when(
      data: (data) => ListView(
        children: [
          Text(
            AppLocalizations.of(context)!.clinicHistoryInfoRecordCode,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data!.registerNumber),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Text(
            AppLocalizations.of(context)!.clinicHistoryFormMentalExamination,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data.mentalExamination),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Text(
            AppLocalizations.of(context)!.clinicHistoryFormMedAntecedents,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data.medAntecedents),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Text(
            AppLocalizations.of(context)!.clinicHistoryFormPsyAntecedents,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data.psyAntecedents),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Text(
            AppLocalizations.of(context)!.clinicHistoryFormPersonalHistory,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data.personalHistory),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Text(
            AppLocalizations.of(context)!.clinicHistoryFormFamilyHistory,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data.familyHistory),
        ],
      ),
      error: (error, stackTrace) => Text(
        AppLocalizations.of(context)!.genericErrorMessage,
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
