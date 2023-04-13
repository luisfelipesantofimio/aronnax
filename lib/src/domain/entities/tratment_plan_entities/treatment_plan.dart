// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/section.dart';

class TreatmentPlan {
  final int id;
  final String title;
  final String description;
  final DateTime creationDate;
  final int creatorId;
  final List<Section> sectionsList;
  TreatmentPlan({
    required this.id,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.creatorId,
    required this.sectionsList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'creationDate': creationDate.millisecondsSinceEpoch,
      'creatorId': creatorId,
      'sectionsList': sectionsList.map((x) => x.toMap()).toList(),
    };
  }

  factory TreatmentPlan.fromLocalModel(LocalTreatmentPlan data) {
    final decodedItems = jsonDecode(data.treatmentData) as List;
    List<Section> sectionsList = decodedItems
        .map(
          (e) => Section.fromJson(e),
        )
        .toList();

    return TreatmentPlan(
        id: data.id,
        title: data.treatmentTitle,
        description: data.treatmentDescription,
        creationDate: data.creationDate,
        creatorId: data.professionalID,
        sectionsList: sectionsList
        // List<Section>.from(
        //   (jsonDecode(data.treatmentData) as List).map<Section>(
        //     (x) => Section.fromJson(x),
        //   ),
        // ),
        );
  }

  factory TreatmentPlan.fromMap(Map<String, dynamic> map) {
    return TreatmentPlan(
      id: map['id'] as int,
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

  TreatmentPlan copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? creationDate,
    int? creatorId,
    List<Section>? sectionsList,
  }) {
    return TreatmentPlan(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      creationDate: creationDate ?? this.creationDate,
      creatorId: creatorId ?? this.creatorId,
      sectionsList: sectionsList ?? this.sectionsList,
    );
  }

  @override
  String toString() {
    return 'TreatmentPlan(id: $id, title: $title, description: $description, creationDate: $creationDate, creatorId: $creatorId, sectionsList: $sectionsList)';
  }
}
