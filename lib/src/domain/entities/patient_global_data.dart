import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:aronnax/src/domain/entities/clinic_history.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/domain/entities/session.dart';

///Data model intended to be used as a global intermediary of all related patient data.

class PatientGlobalData {
  final Patient patient;
  final ClinicHistory clinicHistory;
  final List<PatientCase> caseData;
  final List<Session> sessionData;
  PatientGlobalData({
    required this.patient,
    required this.clinicHistory,
    required this.caseData,
    required this.sessionData,
  });

  PatientGlobalData copyWith({
    Patient? patient,
    ClinicHistory? clinicHistory,
    List<PatientCase>? caseData,
    List<Session>? sessionData,
  }) {
    return PatientGlobalData(
      patient: patient ?? this.patient,
      clinicHistory: clinicHistory ?? this.clinicHistory,
      caseData: caseData ?? this.caseData,
      sessionData: sessionData ?? this.sessionData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patient': patient.toMap(),
      'clinicHistory': clinicHistory.toMap(),
      'caseData': caseData.map((x) => x.toMap()).toList(),
      'sessionData': sessionData.map((x) => x.toMap()).toList(),
    };
  }

  factory PatientGlobalData.fromMap(Map<String, dynamic> map) {
    return PatientGlobalData(
      patient: Patient.fromMap(map['patient'] as Map<String, dynamic>),
      clinicHistory:
          ClinicHistory.fromMap(map['clinicHistory'] as Map<String, dynamic>),
      caseData: List<PatientCase>.from(
        (map['caseData'] as List<int>).map<PatientCase>(
          (x) => PatientCase.fromMap(x as Map<String, dynamic>),
        ),
      ),
      sessionData: List<Session>.from(
        (map['sessionData'] as List<int>).map<Session>(
          (x) => Session.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientGlobalData.fromJson(String source) =>
      PatientGlobalData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PatientGlobalData(patient: $patient, clinicHistory: $clinicHistory, caseData: $caseData, sessionData: $sessionData)';
  }

  @override
  bool operator ==(covariant PatientGlobalData other) {
    if (identical(this, other)) return true;

    return other.patient == patient &&
        other.clinicHistory == clinicHistory &&
        listEquals(other.caseData, caseData) &&
        listEquals(other.sessionData, sessionData);
  }

  @override
  int get hashCode {
    return patient.hashCode ^
        clinicHistory.hashCode ^
        caseData.hashCode ^
        sessionData.hashCode;
  }
}
