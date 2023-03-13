import 'package:aronnax/src/data/repositories/treatment_plans_repository.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class TreatmentPlanRepositoryInterface {
  String encodeTreatmentComponentPlanData(
      List<TreatmentPlanComponent> components);

  List<Widget> decodeTreatmentComponentData(String jsonData);
  void saveLocalTreatmentPlan(
    WidgetRef ref,
    DateTime creationDate,
    String treatmentID,
    String treatmentTitle,
    String treatmentDescription,
    String treatmentData,
    int professionalID,
  );
}

final treatmentPlanRepositoryProvider =
    Provider<TreatmentPlanRepositoryInterface>(
  (ref) => TreatmentPlanRepository(),
);
