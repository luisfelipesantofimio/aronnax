import 'dart:convert';

import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';

class Section {
  final String name;
  final String? description;
  final List<TreatmentPlanComponent> components;
  final bool isComplete;

  ///Value used to define a ´negative´, ´neutral´ or ´positive´ result for a defined section
  final String? outcome;
  Section({
    required this.name,
    this.description,
    this.outcome,
    required this.components,
    required this.isComplete,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'outcome': outcome,
      'components': components
          .map(
            (e) => e.toMap(),
          )
          .toList(),
      'isComplete': isComplete,
    };
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    List data = map['components'];
    List<TreatmentPlanComponent> componentsList = data
        .map(
          (e) => TreatmentPlanComponent.fromMap(e),
        )
        .toList();
    return Section(
      name: map['name'] as String,
      outcome: map['outcome'] as String?,
      description:
          map['description'] != null ? map['description'] as String : null,
      components: componentsList,
      isComplete: map['isComplete'] as bool,
    );
  }

  Section copyWith(
      {String? name,
      String? description,
      String? outcome,
      bool? isComplete,
      List<TreatmentPlanComponent>? components}) {
    return Section(
      name: name ?? this.name,
      description: description ?? this.description,
      outcome: outcome ?? this.outcome,
      isComplete: isComplete ?? this.isComplete,
      components: components ?? this.components,
    );
  }

  String toJson() => json.encode(toMap());

  factory Section.fromJson(String source) =>
      Section.fromMap(json.decode(source) as Map<String, dynamic>);
}
