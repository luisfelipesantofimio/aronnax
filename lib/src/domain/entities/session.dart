import 'dart:convert';

import 'package:aronnax/src/data/database/local_model/local_model.dart';

class Session {
  final String id;
  final DateTime sessionDate;
  final String sessionSummary;
  final String sessionObjectives;
  final String therapeuticArchievements;
  final String? sessionNotes;
  final int sessionPerformance;
  final String? sessionPerformanceExplanation;
  final String patientId;
  final String professionalId;
  final String caseId;
  Session({
    required this.id,
    required this.sessionDate,
    required this.sessionSummary,
    required this.sessionObjectives,
    required this.therapeuticArchievements,
    this.sessionNotes,
    required this.sessionPerformance,
    this.sessionPerformanceExplanation,
    required this.patientId,
    required this.professionalId,
    required this.caseId,
  });

  factory Session.fromLocalModel(LocalSession data) {
    return Session(
        id: data.id,
        sessionDate: data.sessionDate,
        sessionSummary: data.sessionSummary,
        sessionObjectives: data.sessionObjectives,
        therapeuticArchievements: data.therapeuticArchievements,
        sessionNotes: data.sessionNotes,
        sessionPerformance: data.sessionPerformance,
        sessionPerformanceExplanation: data.sessionPerformanceExplanation,
        patientId: data.idNumber,
        professionalId: data.professionalID,
        caseId: data.caseId);
  }

  Session copyWith({
    String? id,
    DateTime? sessionDate,
    String? sessionSummary,
    String? sessionObjectives,
    String? therapeuticArchievements,
    String? sessionNotes,
    int? sessionPerformance,
    String? sessionPerformanceExplanation,
    String? patientId,
    String? professionalId,
    String? caseId,
  }) {
    return Session(
      id: id ?? this.id,
      sessionDate: sessionDate ?? this.sessionDate,
      sessionSummary: sessionSummary ?? this.sessionSummary,
      sessionObjectives: sessionObjectives ?? this.sessionObjectives,
      therapeuticArchievements:
          therapeuticArchievements ?? this.therapeuticArchievements,
      sessionNotes: sessionNotes ?? this.sessionNotes,
      sessionPerformance: sessionPerformance ?? this.sessionPerformance,
      sessionPerformanceExplanation:
          sessionPerformanceExplanation ?? this.sessionPerformanceExplanation,
      patientId: patientId ?? this.patientId,
      professionalId: professionalId ?? this.professionalId,
      caseId: caseId ?? this.caseId,
    );
  }

  @override
  String toString() {
    return 'Session(id: $id, sessionDate: $sessionDate, sessionSummary: $sessionSummary, sessionObjectives: $sessionObjectives, therapeuticArchievements: $therapeuticArchievements, sessionNotes: $sessionNotes, sessionPerformance: $sessionPerformance, sessionPerformanceExplanation: $sessionPerformanceExplanation, patientId: $patientId, professionalId: $professionalId, caseId: $caseId)';
  }

  @override
  bool operator ==(covariant Session other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.sessionDate == sessionDate &&
        other.sessionSummary == sessionSummary &&
        other.sessionObjectives == sessionObjectives &&
        other.therapeuticArchievements == therapeuticArchievements &&
        other.sessionNotes == sessionNotes &&
        other.sessionPerformance == sessionPerformance &&
        other.sessionPerformanceExplanation == sessionPerformanceExplanation &&
        other.patientId == patientId &&
        other.professionalId == professionalId &&
        other.caseId == caseId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sessionDate.hashCode ^
        sessionSummary.hashCode ^
        sessionObjectives.hashCode ^
        therapeuticArchievements.hashCode ^
        sessionNotes.hashCode ^
        sessionPerformance.hashCode ^
        sessionPerformanceExplanation.hashCode ^
        patientId.hashCode ^
        professionalId.hashCode ^
        caseId.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sessionDate': sessionDate.millisecondsSinceEpoch,
      'sessionSummary': sessionSummary,
      'sessionObjectives': sessionObjectives,
      'therapeuticArchievements': therapeuticArchievements,
      'sessionNotes': sessionNotes,
      'sessionPerformance': sessionPerformance,
      'sessionPerformanceExplanation': sessionPerformanceExplanation,
      'patientId': patientId,
      'professionalId': professionalId,
      'caseId': caseId,
    };
  }

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
      id: map['id'] as String,
      sessionDate:
          DateTime.fromMillisecondsSinceEpoch(map['sessionDate'] as int),
      sessionSummary: map['sessionSummary'] as String,
      sessionObjectives: map['sessionObjectives'] as String,
      therapeuticArchievements: map['therapeuticArchievements'] as String,
      sessionNotes:
          map['sessionNotes'] != null ? map['sessionNotes'] as String : null,
      sessionPerformance: map['sessionPerformance'] as int,
      sessionPerformanceExplanation:
          map['sessionPerformanceExplanation'] != null
              ? map['sessionPerformanceExplanation'] as String
              : null,
      patientId: map['patientId'] as String,
      professionalId: map['professionalId'] as String,
      caseId: map['caseId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Session.fromJson(String source) =>
      Session.fromMap(json.decode(source) as Map<String, dynamic>);
}
