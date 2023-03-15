import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:aronnax/src/presentation/treatment_plans/treatment_plan_creation/treatment_plan_creation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreatmentPlanListElement extends ConsumerWidget {
  const TreatmentPlanListElement({Key? key, required this.treatmentPlanData})
      : super(key: key);
  final TreatmentPlan treatmentPlanData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: Color.fromARGB(255, 215, 215, 215),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              treatmentPlanData.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              treatmentPlanData.description,
            ),
            const Padding(
              padding: EdgeInsets.all(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Número de fases: ${treatmentPlanData.sectionsList.length}'),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TreatmentPlanCreationView(treatmentPlanData),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(localDatabaseRepositoryProvider)
                            .deleteLocalTreatmentPlan(treatmentPlanData.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Treatment plan removed'),
                          ),
                        );
                        ref.invalidate(treatmentPlanListProvider);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
