import 'package:aronnax/src/data/interfaces/treatment_plans_repository_interface.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final treatmentPlanComponentDecoding =
    StateProvider.family<List<Widget>, String>(
  (ref, componentsList) {
    List<Widget> decodedWidgets = ref
        .read(treatmentPlanRepositoryProvider)
        .decodeTreatmentComponentData(componentsList);

    return decodedWidgets;
  },
);

final currentTreatmentPlanResponseProvider =
    StateProvider<TreatmentPlanResult?>((ref) => null);

final currentTreatmentPlanResponseListProvider =
    StateProvider<List<TreatmentPlanResultValue>>(
  (ref) => [],
);

final treatmentPlanResultDecoding =
    StateProvider.family<List<TreatmentPlanResultValue>, String>(
  (ref, componentsList) {
    TreatmentPlanResult decodedResult = ref
        .read(treatmentPlanRepositoryProvider)
        .decodeTreatmentPlanResults(componentsList);

    final List<TreatmentPlanResultValue> values = decodedResult.results;

    return values;
  },
);

final treatmentPlanListProvider =
    FutureProvider.family<List<TreatmentPlan>, bool>(
  (ref, isOffline) => ref
      .read(treatmentPlanRepositoryProvider)
      .getTreatmentPlansList(isOffline, ref),
);
