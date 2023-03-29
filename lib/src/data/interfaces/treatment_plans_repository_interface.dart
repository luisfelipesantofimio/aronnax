import 'package:aronnax/src/data/repositories/treatment_plans_repository.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/section.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class TreatmentPlanRepositoryInterface {
  Future<List<TreatmentPlan>> getTreatmentPlansList(bool isOffline, Ref ref);
  String encodeTreatmentPlanData(List<Section> components);
  List<Widget> decodeTreatmentPlanData(String jsonData);
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

  void updateTreatmentPlan(
      bool isOffline, TreatmentPlan treatmentPlanData, WidgetRef ref);

  String encodeTreatmentPlanResults(TreatmentPlanResult resultData);
  TreatmentPlanResult decodeTreatmentPlanResults(String encodedResultData);
}

final treatmentPlanRepositoryProvider =
    Provider<TreatmentPlanRepositoryInterface>(
  (ref) => TreatmentPlanRepository(),
);
