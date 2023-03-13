import 'dart:convert';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/section.dart';

class TreatmentPlan {
  final String title;
  final String description;
  final DateTime creationDate;
  final int creatorId;
  final List<Section> sectionsList;
  TreatmentPlan({
    required this.title,
    required this.description,
    required this.creationDate,
    required this.creatorId,
    required this.sectionsList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'creationDate': creationDate.millisecondsSinceEpoch,
      'creatorId': creatorId,
      'sectionsList': sectionsList.map((x) => x.toMap()).toList(),
    };
  }

  factory TreatmentPlan.fromMap(Map<String, dynamic> map) {
    return TreatmentPlan(
      title: map['title'] as String,
      description: map['description'] as String,
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int),
      creatorId: map['creatorId'] as int,
      sectionsList: List<Section>.from(
        (map['sectionsList'] as List<int>).map<Section>(
          (x) => Section.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TreatmentPlan.fromJson(String source) =>
      TreatmentPlan.fromMap(json.decode(source) as Map<String, dynamic>);
}
