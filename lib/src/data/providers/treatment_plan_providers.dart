import 'dart:convert';
import 'dart:developer';
import 'package:aronnax/src/data/interfaces/treatment_plans_repository_interface.dart';
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
