import 'dart:convert';

import 'package:aronnax/src/data/database/local_model/local_model.dart';

class ClinicHistory {
  final int id;
  final String registerNumber;
  final DateTime creationDate;
  final String mentalExamination;
  final String medAntecedents;
  final String psyAntecedents;
  final String familyHistory;
  final String personalHistory;
  final int idNumber;
  final int professionalId;
  ClinicHistory({
    required this.id,
    required this.registerNumber,
    required this.creationDate,
    required this.mentalExamination,
    required this.medAntecedents,
    required this.psyAntecedents,
    required this.familyHistory,
    required this.personalHistory,
    required this.idNumber,
    required this.professionalId,
  });

  factory ClinicHistory.fromLocalModel(LocalClinicHistoryData data) {
    return ClinicHistory(
      id: data.id,
      registerNumber: data.registerNumber,
      creationDate: data.currentDate,
      mentalExamination: data.mentalExamination,
      medAntecedents: data.medAntecedents,
      psyAntecedents: data.psyAntecedents,
      familyHistory: data.familyHistory,
      personalHistory: data.personalHistory,
      idNumber: data.patientId,
      professionalId: data.professionalID,
    );
  }

  ClinicHistory copyWith({
    int? id,
    String? registerNumber,
    DateTime? creationDate,
    String? mentalExamination,
    String? medAntecedents,
    String? psyAntecedents,
    String? familyHistory,
    String? personalHistory,
    int? idNumber,
    int? professionalId,
  }) {
    return ClinicHistory(
      id: id ?? this.id,
      registerNumber: registerNumber ?? this.registerNumber,
      creationDate: creationDate ?? this.creationDate,
      mentalExamination: mentalExamination ?? this.mentalExamination,
      medAntecedents: medAntecedents ?? this.medAntecedents,
      psyAntecedents: psyAntecedents ?? this.psyAntecedents,
      familyHistory: familyHistory ?? this.familyHistory,
      personalHistory: personalHistory ?? this.personalHistory,
      idNumber: idNumber ?? this.idNumber,
      professionalId: professionalId ?? this.professionalId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'registerNumber': registerNumber,
      'creationDate': creationDate.millisecondsSinceEpoch,
      'mentalExamination': mentalExamination,
      'medAntecedents': medAntecedents,
      'psyAntecedents': psyAntecedents,
      'familyHistory': familyHistory,
      'personalHistory': personalHistory,
      'idNumber': idNumber,
      'professionalId': professionalId,
    };
  }

  factory ClinicHistory.fromMap(Map<String, dynamic> map) {
    return ClinicHistory(
      id: map['id'] as int,
      registerNumber: map['registerNumber'] as String,
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int),
      mentalExamination: map['mentalExamination'] as String,
      medAntecedents: map['medAntecedents'] as String,
      psyAntecedents: map['psyAntecedents'] as String,
      familyHistory: map['familyHistory'] as String,
      personalHistory: map['personalHistory'] as String,
      idNumber: map['idNumber'] as int,
      professionalId: map['professionalId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClinicHistory.fromJson(String source) =>
      ClinicHistory.fromMap(json.decode(source) as Map<String, dynamic>);
}
