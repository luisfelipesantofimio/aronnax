// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';

class TreatmentPlanComponent {
  int? id;
  final String componentType;
  final String componentTitle;
  final String componentDescription;
  final bool isRequired;
  final bool messurable;
  final List<TreatmentPlanOption>? optionsList;
  TreatmentPlanComponent({
    this.id,
    required this.componentType,
    required this.componentTitle,
    required this.componentDescription,
    required this.isRequired,
    required this.messurable,
    this.optionsList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'componentType': componentType,
      'componentTitle': componentTitle,
      'componentDescription': componentDescription,
      'isRequired': isRequired,
      'messurable': messurable,
      'optionsList': optionsList
          ?.map(
            (e) => e.toMap(),
          )
          .toList(),
    };
  }

  factory TreatmentPlanComponent.fromMap(Map<String, dynamic> map) {
    final id = map['id'] as int?;
    final componentType = map['componentType'] as String;
    final componentTitle = map['componentTitle'] as String;
    final componentDescription = map['componentDescription'] as String;
    final optionsList =
        map['optionsList'] != null ? map['optionsList'] as List : null;
    final isRequired = map['isRequired'] as bool;
    final messurable = map['messurable'] as bool;

    return TreatmentPlanComponent(
      id: id,
      messurable: messurable,
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
    int? id,
    String? componentType,
    String? componentTitle,
    String? componentDescription,
    bool? isRequired,
    bool? messurable,
    List<TreatmentPlanOption>? optionsList,
  }) {
    return TreatmentPlanComponent(
      id: id ?? this.id,
      componentType: componentType ?? this.componentType,
      componentTitle: componentTitle ?? this.componentTitle,
      componentDescription: componentDescription ?? this.componentDescription,
      isRequired: isRequired ?? this.isRequired,
      messurable: messurable ?? this.messurable,
      optionsList: optionsList ?? this.optionsList,
    );
  }

  @override
  String toString() {
    return 'TreatmentPlanComponent(id: $id, componentType: $componentType, componentTitle: $componentTitle, componentDescription: $componentDescription, isRequired: $isRequired, messurable: $messurable, optionsList: $optionsList)';
  }

  @override
  bool operator ==(covariant TreatmentPlanComponent other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.componentType == componentType &&
        other.componentTitle == componentTitle &&
        other.componentDescription == componentDescription &&
        other.isRequired == isRequired &&
        other.messurable == messurable &&
        listEquals(other.optionsList, optionsList);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        componentType.hashCode ^
        componentTitle.hashCode ^
        componentDescription.hashCode ^
        isRequired.hashCode ^
        messurable.hashCode ^
        optionsList.hashCode;
  }
}
