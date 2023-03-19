import 'package:aronnax/src/data/database/local_model/local_model.dart';

class ClinicHistory {
  final int id;
  final String registerNumber;
  final DateTime creationDate;
  final String consultationReason;
  final String mentalExamination;
  final String treatment;
  final String medAntecedents;
  final String psyAntecedents;
  final String familyHistory;
  final String personalHistory;
  final String diagnostic;
  final int idNumber;
  final int professionalId;
  ClinicHistory({
    required this.id,
    required this.registerNumber,
    required this.creationDate,
    required this.consultationReason,
    required this.mentalExamination,
    required this.treatment,
    required this.medAntecedents,
    required this.psyAntecedents,
    required this.familyHistory,
    required this.personalHistory,
    required this.diagnostic,
    required this.idNumber,
    required this.professionalId,
  });

  factory ClinicHistory.fromLocalModel(LocalClinicHistoryData data) {
    return ClinicHistory(
      id: data.id,
      registerNumber: data.registerNumber,
      creationDate: data.currentDate,
      consultationReason: data.consultationReason,
      mentalExamination: data.mentalExamination,
      treatment: data.treatment,
      medAntecedents: data.medAntecedents,
      psyAntecedents: data.psyAntecedents,
      familyHistory: data.familyHistory,
      personalHistory: data.personalHistory,
      diagnostic: data.diagnostic,
      idNumber: data.idNumber,
      professionalId: data.professionalID,
    );
  }

  ClinicHistory copyWith({
    int? id,
    String? registerNumber,
    DateTime? creationDate,
    String? consultationReason,
    String? mentalExamination,
    String? treatment,
    String? medAntecedents,
    String? psyAntecedents,
    String? familyHistory,
    String? personalHistory,
    String? diagnostic,
    int? idNumber,
    int? professionalId,
  }) {
    return ClinicHistory(
      id: id ?? this.id,
      registerNumber: registerNumber ?? this.registerNumber,
      creationDate: creationDate ?? this.creationDate,
      consultationReason: consultationReason ?? this.consultationReason,
      mentalExamination: mentalExamination ?? this.mentalExamination,
      treatment: treatment ?? this.treatment,
      medAntecedents: medAntecedents ?? this.medAntecedents,
      psyAntecedents: psyAntecedents ?? this.psyAntecedents,
      familyHistory: familyHistory ?? this.familyHistory,
      personalHistory: personalHistory ?? this.personalHistory,
      diagnostic: diagnostic ?? this.diagnostic,
      idNumber: idNumber ?? this.idNumber,
      professionalId: professionalId ?? this.professionalId,
    );
  }
}
