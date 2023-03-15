import 'dart:convert';
import 'dart:developer';
import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/treatment_plans_repository_interface.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/section.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';
import 'package:aronnax/src/presentation/widgets/treatment_plan_build_widgets/treatment_plan_radio_component.dart';
import 'package:aronnax/src/presentation/widgets/treatment_plan_build_widgets/treatment_plan_selection_component.dart';
import 'package:aronnax/src/presentation/widgets/treatment_plan_build_widgets/treatment_plan_task_component.dart';
import 'package:aronnax/src/presentation/widgets/treatment_plan_build_widgets/treatment_plan_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreatmentPlanRepository implements TreatmentPlanRepositoryInterface {
  @override
  String encodeTreatmentComponentPlanData(
      List<TreatmentPlanComponent> components) {
    return json.encode(components.map((e) => e.toJson()).toList());
  }

  @override
  List<Widget> decodeTreatmentComponentData(String jsonData) {
    List<Widget> decodedWidgets = [];
    List data = json.decode(jsonData);
    for (var element in data) {
      TreatmentPlanComponent component =
          TreatmentPlanComponent.fromJson(element);
      if (component.componentType == 'textField') {
        decodedWidgets.add(
          TreatmentPlanTextField(
            fieldDescription: component.componentDescription,
            fieldTitle: component.componentTitle,
            hintText: component.componentHint ?? '',
            maxLenght: 1,
            isRequired: component.isRequired,
          ),
        );
      }
      if (component.componentType == 'scale') {
        List<TreatmentPlanOption> optionsList = component.optionsList ?? [];
        decodedWidgets.add(
          TreatmentPlanScaleComponent(
            isRequired: component.isRequired,
            description: component.componentDescription,
            valuesList: optionsList,
            title: component.componentTitle,
          ),
        );
      }
      if (component.componentType == 'selection') {
        List<TreatmentPlanOption> optionsList = component.optionsList ?? [];
        decodedWidgets.add(
          TreatmentPlanSelectionComponent(
            isRequired: component.isRequired,
            description: component.componentDescription,
            valuesList: optionsList,
            title: component.componentTitle,
          ),
        );
      }
      if (component.componentType == 'task') {
        decodedWidgets.add(
          TreatmentPlanTaskComponent(
            isRequired: component.isRequired,
            description: component.componentDescription,
            title: component.componentTitle,
          ),
        );
      }
    }
    return decodedWidgets;
  }

  @override
  void saveLocalTreatmentPlan(
      WidgetRef ref,
      DateTime creationDate,
      String treatmentID,
      String treatmentTitle,
      String treatmentDescription,
      String treatmentData,
      int professionalID) {
    // TODO: implement saveLocalTreatmentPlan
  }

  @override
  List<Widget> decodeTreatmentPlanData(String jsonData) {
    // TODO: implement decodeTreatmentPlanData
    throw UnimplementedError();
  }

  @override
  String encodeTreatmentPlanData(List<Section> components) {
    log(json.encode(components.map((e) => e.toJson()).toList()));
    return json.encode(components.map((e) => e.toJson()).toList());
  }

  @override
  Future<List<TreatmentPlan>> getTreatmentPlansList(
      bool isOffline, Ref ref) async {
    if (isOffline) {
      List<LocalTreatmentPlan> localPlans = await ref
          .read(localDatabaseRepositoryProvider)
          .getLocalTreatmentPlans();
      log(localPlans.toString());
      return localPlans.map((e) => TreatmentPlan.fromLocalModel(e)).toList();
    } else {
      return [];
    }
  }
}
