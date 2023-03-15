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
    List data = map['components'];
    List<TreatmentPlanComponent> componentsList = data
        .map(
          (e) => TreatmentPlanComponent.fromMap(e),
        )
        .toList();
    return Section(
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      components: componentsList,
      //  List<TreatmentPlanComponent>.from(
      //   (map['components'] as List<int>).map<TreatmentPlanComponent>(
      //     (x) => TreatmentPlanComponent.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
    );
  }

  Section copyWith(
      {String? name,
      String? description,
      List<TreatmentPlanComponent>? components}) {
    return Section(
      name: name ?? this.name,
      description: description ?? this.description,
      components: components ?? this.components,
    );
  }

  String toJson() => json.encode(toMap());

  factory Section.fromJson(String source) =>
      Section.fromMap(json.decode(source) as Map<String, dynamic>);
}
