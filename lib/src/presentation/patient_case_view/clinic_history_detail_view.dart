import 'package:aronnax/src/data/providers/clinic_history_data_provider.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClinicHistoryDetailView extends ConsumerWidget {
  const ClinicHistoryDetailView({Key? key, required this.patientData})
      : super(key: key);
  final Patient patientData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clinicHistoryData = ref.watch(
      clinicHistoryByIdProvider(patientData.id),
    );

    return clinicHistoryData.when(
      data: (data) => ListView(
        children: [
          const Text(
            'Register number',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data!.registerNumber),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          const Text(
            'Mental examination',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data.mentalExamination),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          const Text(
            'Medical antecedents',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data.medAntecedents),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          const Text(
            'Psychological antecedents',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data.psyAntecedents),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          const Text(
            'Personal history',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data.personalHistory),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          const Text(
            'Family history',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data.familyHistory),
        ],
      ),
      error: (error, stackTrace) => const Text('Something went wrong'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
