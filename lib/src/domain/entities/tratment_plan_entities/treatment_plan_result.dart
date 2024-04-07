// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';

class TreatmentPlanResult {
  final String? id;
  final DateTime applicationDate;
  final int sessionNumber;
  final String patientId;
  final String professionalId;
  final String treatmentPlanId;
  final String caseId;
  final int phaseNumber;
  final List<TreatmentPlanResultValue> results;
  TreatmentPlanResult({
    this.id,
    required this.applicationDate,
    required this.sessionNumber,
    required this.patientId,
    required this.professionalId,
    required this.treatmentPlanId,
    required this.caseId,
    required this.phaseNumber,
    required this.results,
  });

  TreatmentPlanResult copyWith({
    String? id,
    DateTime? applicationDate,
    int? sessionNumber,
    String? patientId,
    String? professionalId,
    String? treatmentPlanId,
    String? caseId,
    int? phaseNumber,
    List<TreatmentPlanResultValue>? results,
  }) {
    return TreatmentPlanResult(
      id: id ?? this.id,
      applicationDate: applicationDate ?? this.applicationDate,
      sessionNumber: sessionNumber ?? this.sessionNumber,
      patientId: patientId ?? this.patientId,
      professionalId: professionalId ?? this.professionalId,
      treatmentPlanId: treatmentPlanId ?? this.treatmentPlanId,
      caseId: caseId ?? this.caseId,
      phaseNumber: phaseNumber ?? this.phaseNumber,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'applicationDate': applicationDate.millisecondsSinceEpoch,
      'sessionNumber': sessionNumber,
      'patientId': patientId,
      'professionalId': professionalId,
      'treatmentPlanId': treatmentPlanId,
      'caseId': caseId,
      'phaseNumber': phaseNumber,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory TreatmentPlanResult.fromMap(Map<String, dynamic> map) {
    return TreatmentPlanResult(
      id: map['id'] != null ? map['id'] as String : null,
      applicationDate:
          DateTime.fromMillisecondsSinceEpoch(map['applicationDate'] as int),
      sessionNumber: map['sessionNumber'] as int,
      patientId: map['patientId'] as String,
      professionalId: map['professionalId'] as String,
      treatmentPlanId: map['treatmentPlanId'] as String,
      caseId: map['caseId'] as String,
      phaseNumber: map['phaseNumber'] as int,
      results: List<TreatmentPlanResultValue>.from(
        (map['results'] as List<int>).map<TreatmentPlanResultValue>(
          (x) => TreatmentPlanResultValue.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TreatmentPlanResult.fromJson(String source) =>
      TreatmentPlanResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TreatmentPlanResult(id: $id, applicationDate: $applicationDate, sessionNumber: $sessionNumber, patientId: $patientId, professionalId: $professionalId, treatmentPlanId: $treatmentPlanId, caseId: $caseId, phaseNumber: $phaseNumber, results: $results)';
  }

  @override
  bool operator ==(covariant TreatmentPlanResult other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.applicationDate == applicationDate &&
        other.sessionNumber == sessionNumber &&
        other.patientId == patientId &&
        other.professionalId == professionalId &&
        other.treatmentPlanId == treatmentPlanId &&
        other.caseId == caseId &&
        other.phaseNumber == phaseNumber &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        applicationDate.hashCode ^
        sessionNumber.hashCode ^
        patientId.hashCode ^
        professionalId.hashCode ^
        treatmentPlanId.hashCode ^
        caseId.hashCode ^
        phaseNumber.hashCode ^
        results.hashCode;
  }

  factory TreatmentPlanResult.fromLocalModel(LocalTreatmentResult data) {
    final decodedData = jsonDecode(data.treatmentResultsData) as List;
    List<TreatmentPlanResultValue> resultsList =
        decodedData.map((e) => TreatmentPlanResultValue.fromMap(e)).toList();
    return TreatmentPlanResult(
        applicationDate: data.applicationDate,
        sessionNumber: data.sessionNumber,
        patientId: data.patientID,
        professionalId: data.professionalID,
        treatmentPlanId: data.treatmentPlanID,
        caseId: data.patientCaseId,
        phaseNumber: data.phaseNumber,
        results: resultsList);
  }
}
