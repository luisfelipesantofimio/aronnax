import 'package:aronnax/src/data/interfaces/treatment_plans_repository_interface.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ResultsVisualizationItem extends ConsumerWidget {
  const ResultsVisualizationItem({super.key, required this.resultsData});
  final TreatmentPlanResult resultsData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> componentsList = ref
        .read(treatmentPlanRepositoryProvider)
        .parserTreatmentPlanResults(resultsData.results);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 226, 226, 226),
              offset: Offset(0, 6),
              blurRadius: 6),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Results from ${DateFormat('dd/MM/yyyy').format(resultsData.applicationDate)} (Phase ${resultsData.phaseNumber + 1})',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: componentsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${index + 1}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                      ),
                      componentsList[index]
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
