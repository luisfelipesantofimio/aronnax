// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';

class TreatmentPlanResult {
  final int? id;
  final DateTime applicationDate;
  final int sessionNumber;
  final int patientId;
  final int professionalId;
  final int treatmentPlanId;
  final List<TreatmentPlanResultValue> results;
  TreatmentPlanResult({
    this.id,
    required this.applicationDate,
    required this.sessionNumber,
    required this.patientId,
    required this.professionalId,
    required this.treatmentPlanId,
    required this.results,
  });

  TreatmentPlanResult copyWith({
    int? id,
    DateTime? applicationDate,
    int? sessionNumber,
    int? patientId,
    int? professionalId,
    int? treatmentPlanId,
    List<TreatmentPlanResultValue>? results,
  }) {
    return TreatmentPlanResult(
      id: id ?? this.id,
      applicationDate: applicationDate ?? this.applicationDate,
      sessionNumber: sessionNumber ?? this.sessionNumber,
      patientId: patientId ?? this.patientId,
      professionalId: professionalId ?? this.professionalId,
      treatmentPlanId: treatmentPlanId ?? this.treatmentPlanId,
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
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory TreatmentPlanResult.fromMap(Map<String, dynamic> map) {
    return TreatmentPlanResult(
      id: map['id'] != null ? map['id'] as int : null,
      applicationDate:
          DateTime.fromMillisecondsSinceEpoch(map['applicationDate'] as int),
      sessionNumber: map['sessionNumber'] as int,
      patientId: map['patientId'] as int,
      professionalId: map['professionalId'] as int,
      treatmentPlanId: map['treatmentPlanId'] as int,
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
    return 'TreatmentPlanResult(id: $id, applicationDate: $applicationDate, sessionNumber: $sessionNumber, patientId: $patientId, professionalId: $professionalId, treatmentPlanId: $treatmentPlanId, results: $results)';
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
        results.hashCode;
  }
}
