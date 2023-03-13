import 'dart:convert';

import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';

class Section {
  final String name;
  final String? description;
  final List<TreatmentPlanComponent> components;
  Section({
    required this.name,
    this.description,
    required this.components,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'components': components
          .map(
            (e) => e.toMap(),
          )
          .toList(),
    };
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      components: List<TreatmentPlanComponent>.from(
        (map['components'] as List<int>).map<TreatmentPlanComponent>(
          (x) => TreatmentPlanComponent.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Section.fromJson(String source) =>
      Section.fromMap(json.decode(source) as Map<String, dynamic>);
}
