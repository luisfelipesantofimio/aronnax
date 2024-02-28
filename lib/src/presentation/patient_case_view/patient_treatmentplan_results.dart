import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result.dart';
import 'package:aronnax/src/presentation/widgets/results_visualization/results_visualization_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientTreatmentPlanResultsView extends ConsumerStatefulWidget {
  const PatientTreatmentPlanResultsView({
    super.key,
    required this.patientId,
    required this.caseData,
  });
  final int patientId;
  final PatientCase caseData;

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
        List<TreatmentPlanResult> filteredList = data
            .where((element) => element.caseId == widget.caseData.id)
            .toList();
        return filteredList.isEmpty
            ? Text(AppLocalizations.of(context)!.genericEmptyData)
            : ListView.builder(
                itemCount: filteredList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ResultsVisualizationItem(
                      resultsData: filteredList[index],
                    ),
                  );
                },
              );
      },
      error: (error, stackTrace) =>
          Text('${AppLocalizations.of(context)!.genericErrorMessage}: $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
