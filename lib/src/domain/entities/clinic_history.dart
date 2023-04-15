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
}
