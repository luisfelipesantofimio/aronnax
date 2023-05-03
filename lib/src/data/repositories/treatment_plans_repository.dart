import 'dart:convert';
import 'dart:developer';
import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/treatment_plans_repository_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/section.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result.dart';
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
    log(jsonData);
    List<Widget> decodedWidgets = [];
    List data = json.decode(jsonData);
    for (var element in data) {
      TreatmentPlanComponent component =
          TreatmentPlanComponent.fromJson(element);
      if (component.componentType == 'textField') {
        decodedWidgets.add(
          TreatmentPlanTextField(
            componentData: component,
          ),
        );
      }
      if (component.componentType == 'scale') {
        List<TreatmentPlanOption> optionsList = component.optionsList ?? [];
        decodedWidgets.add(
          TreatmentPlanScaleComponent(
            componentData: component,
            valuesList: optionsList,
          ),
        );
      }
      if (component.componentType == 'selection') {
        List<TreatmentPlanOption> optionsList = component.optionsList ?? [];
        decodedWidgets.add(
          TreatmentPlanSelectionComponent(
            componentData: component,
            valuesList: optionsList,
          ),
        );
      }
      if (component.componentType == 'task') {
        decodedWidgets.add(
          TreatmentPlanTaskComponent(
            componentData: component,
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
    return json.encode(components.map((e) => e.toJson()).toList());
  }

  @override
  Future<List<TreatmentPlan>> getTreatmentPlansList(
      bool isOffline, Ref ref) async {
    if (isOffline) {
      List<LocalTreatmentPlan> localPlans = await ref
          .read(localDatabaseRepositoryProvider)
          .getLocalTreatmentPlans();
      return localPlans.map((e) => TreatmentPlan.fromLocalModel(e)).toList();
    } else {
      return [];
    }
  }

  @override
  void updateTreatmentPlan(
      bool isOffline, TreatmentPlan treatmentPlanData, WidgetRef ref) {
    if (isOffline) {
      ref
          .read(localDatabaseRepositoryProvider)
          .updateLocalTreatmentPlan(treatmentPlanData);
    }
  }

  @override
  TreatmentPlanResult decodeTreatmentPlanResults(String encodedResultData) {
    return TreatmentPlanResult.fromJson(encodedResultData);
  }

  @override
  String encodeTreatmentPlanResults(TreatmentPlanResult resultData) {
    return json.encode(resultData.toJson());
  }

  @override
  void saveTreatmentPlanResults(
      WidgetRef ref, TreatmentPlanResult results, PatientCase caseData) {
    if (ref.read(offlineStatusProvider).value!) {
      ref.read(localDatabaseRepositoryProvider).insertLocalTreatmentPlanResult(
            sessionNumber: results.sessionNumber,
            phaseNumber: results.phaseNumber,
            applicationDate: results.applicationDate,
            treatmentPlanID: results.treatmentPlanId,
            patientID: results.patientId,
            professionalID: results.professionalId,
            patientCaseID: caseData.id,
            treatmentResultData:
                results.results.map((e) => e.toJson()).toList().toString(),
          );
    }
  }
}
