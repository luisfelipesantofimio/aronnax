import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/presentation/widgets/results_visualization/results_visualization_item.dart';
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
        return data.isEmpty
            ? const Text('There is not data.')
            : ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ResultsVisualizationItem(
                    resultsData: data[index],
                  );
                },
              );
      },
      error: (error, stackTrace) => Text('Something went wrong $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
