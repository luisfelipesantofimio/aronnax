import 'dart:developer';
import 'package:aronnax/src/data/interfaces/treatment_plans_repository_interface.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final treatmentPlanComponentDecoding =
    StateProvider.family<List<Widget>, String>(
  (ref, componentsList) {
    log(componentsList);
    List<Widget> decodedWidgets = ref
        .read(treatmentPlanRepositoryProvider)
        .decodeTreatmentComponentData(componentsList);
    log(decodedWidgets.toString());
    return decodedWidgets;
  },
);

final treatmentPlanListProvider =
    FutureProvider.family<List<TreatmentPlan>, bool>(
  (ref, isOffline) => ref
      .read(treatmentPlanRepositoryProvider)
      .getTreatmentPlansList(isOffline, ref),
);
