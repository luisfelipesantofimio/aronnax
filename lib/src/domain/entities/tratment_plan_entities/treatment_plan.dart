// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/section.dart';

class TreatmentPlan {
  final String id;
  final String title;
  final String description;
  final DateTime creationDate;
  final String creatorId;
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
    final sectionData = map['sectionsList'] as List;
    List<Section> parsedSectionList = sectionData
        .map(
          (e) => Section.fromMap(e),
        )
        .toList();
    return TreatmentPlan(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int),
      creatorId: map['creatorId'] as String,
      sectionsList: parsedSectionList,
    );
  }

  String toJson() => json.encode(toMap());

  factory TreatmentPlan.fromJson(String source) =>
      TreatmentPlan.fromMap(json.decode(source) as Map<String, dynamic>);

  TreatmentPlan copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? creationDate,
    String? creatorId,
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
