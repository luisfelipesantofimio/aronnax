import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientTreatmentPlanResultsView extends ConsumerStatefulWidget {
  const PatientTreatmentPlanResultsView({
    Key? key,
    required this.patientId,
  }) : super(key: key);
  final int patientId;

  @override
  ConsumerState<PatientTreatmentPlanResultsView> createState() =>
      _PatientTreatmentPlanResultsViewState();
}

class _PatientTreatmentPlanResultsViewState
    extends ConsumerState<PatientTreatmentPlanResultsView> {
  @override
  Widget build(BuildContext context) {
    final resultsData = ref.watch(
      patientsTreatmentPlanResultsProvider(widget.patientId),
    );
    return resultsData.when(
      data: (data) {
        return ListView.builder(
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            List<TreatmentPlanResultValue> resultsList = data[index].results;
            return ListView.builder(
              itemCount: resultsList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(data[index].applicationDate.toIso8601String()),
                    resultsList[index].value,
                  ],
                );
              },
            );
          },
        );
      },
      error: (error, stackTrace) => Text('Something went wrong $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
