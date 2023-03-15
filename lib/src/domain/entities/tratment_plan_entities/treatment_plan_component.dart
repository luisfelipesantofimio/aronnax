// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';

class TreatmentPlanComponent {
  final String componentType;
  final String componentTitle;
  final String componentDescription;
  final bool isRequired;
  final List<TreatmentPlanOption>? optionsList;
  TreatmentPlanComponent({
    required this.componentType,
    required this.componentTitle,
    required this.componentDescription,
    required this.isRequired,
    required this.optionsList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'componentType': componentType,
      'componentTitle': componentTitle,
      'componentDescription': componentDescription,
      'isRequired': isRequired,
      'optionsList': optionsList
          ?.map(
            (e) => e.toMap(),
          )
          .toList(),
    };
  }

  factory TreatmentPlanComponent.fromMap(Map<String, dynamic> map) {
    final componentType = map['componentType'] as String;
    final componentTitle = map['componentTitle'] as String;
    final componentDescription = map['componentDescription'] as String;
    final optionsList =
        map['optionsList'] != null ? map['optionsList'] as List : null;
    final isRequired = map['isRequired'] as bool;

    return TreatmentPlanComponent(
      componentType: componentType,
      componentTitle: componentTitle,
      componentDescription: componentDescription,
      isRequired: isRequired,
      optionsList: optionsList
          ?.map(
            (e) => TreatmentPlanOption.fromMap(e),
          )
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TreatmentPlanComponent.fromJson(String source) =>
      TreatmentPlanComponent.fromMap(
          json.decode(source) as Map<String, dynamic>);

  TreatmentPlanComponent copyWith({
    String? componentType,
    String? componentTitle,
    String? componentDescription,
    bool? isRequired,
    List<TreatmentPlanOption>? optionsList,
  }) {
    return TreatmentPlanComponent(
      componentType: componentType ?? this.componentType,
      componentTitle: componentTitle ?? this.componentTitle,
      componentDescription: componentDescription ?? this.componentDescription,
      isRequired: isRequired ?? this.isRequired,
      optionsList: optionsList ?? this.optionsList,
    );
  }
}
