// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aronnax/src/data/database/local_model/local_model.dart';

class PatientCase {
  final int id;
  final DateTime creationDate;
  final int patientId;
  final int professionalId;
  final String consultationReason;
  final String diagnostic;
  final String? icdDiagnosticCode;
  final String treatmentProposal;
  final String? caseNotes;
  final bool isActive;
  final bool patientCaseClosed;
  final String? treatmentPlanOutcome;
  final String? treatmentPlanOutcomeExplanation;
  final int? treatmentPlanId;
  final int? currentTreatmentPlanPhase;
  PatientCase({
    required this.id,
    required this.creationDate,
    required this.patientId,
    required this.professionalId,
    required this.consultationReason,
    required this.diagnostic,
    this.icdDiagnosticCode,
    required this.treatmentProposal,
    this.caseNotes,
    required this.isActive,
    required this.patientCaseClosed,
    this.treatmentPlanOutcome,
    this.treatmentPlanOutcomeExplanation,
    this.treatmentPlanId,
    this.currentTreatmentPlanPhase,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'creationDate': creationDate.millisecondsSinceEpoch,
      'patientId': patientId,
      'professionalId': professionalId,
      'consultationReason': consultationReason,
      'diagnostic': diagnostic,
      'icdDiagnosticCode': icdDiagnosticCode,
      'treatmentProposal': treatmentProposal,
      'caseNotes': caseNotes,
      'isActive': isActive,
      'patientCaseClosed': patientCaseClosed,
      'treatmentPlanOutcome': treatmentPlanOutcome,
      'treatmentPlanOutcomeExplanation': treatmentPlanOutcomeExplanation,
      'treatmentPlanId': treatmentPlanId,
      'currentTreatmentPlanPhase': currentTreatmentPlanPhase,
    };
  }

  factory PatientCase.fromMap(Map<String, dynamic> map) {
    return PatientCase(
      id: map['id'] as int,
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int),
      patientId: map['patientId'] as int,
      professionalId: map['professionalId'] as int,
      consultationReason: map['consultationReason'] as String,
      diagnostic: map['diagnostic'] as String,
      icdDiagnosticCode: map['icdDiagnosticCode'] != null
          ? map['icdDiagnosticCode'] as String
          : null,
      treatmentProposal: map['treatmentProposal'] as String,
      caseNotes: map['caseNotes'] != null ? map['caseNotes'] as String : null,
      isActive: map['isActive'] as bool,
      patientCaseClosed: map['patientCaseClosed'] as bool,
      treatmentPlanOutcome: map['treatmentPlanOutcome'] != null
          ? map['treatmentPlanOutcome'] as String
          : null,
      treatmentPlanOutcomeExplanation:
          map['treatmentPlanOutcomeExplanation'] != null
              ? map['treatmentPlanOutcomeExplanation'] as String
              : null,
      treatmentPlanId:
          map['treatmentPlanId'] != null ? map['treatmentPlanId'] as int : null,
      currentTreatmentPlanPhase: map['currentTreatmentPlanPhase'] != null
          ? map['currentTreatmentPlanPhase'] as int
          : null,
    );
  }

  factory PatientCase.fromLocalModel(LocalPatientCaseData data) {
    return PatientCase(
        id: data.id,
        creationDate: data.creationDate,
        patientId: data.patientId,
        professionalId: data.professionalId,
        consultationReason: data.consultationReason,
        diagnostic: data.diagnostic,
        treatmentProposal: data.treatmentProposal,
        caseNotes: data.caseNotes,
        isActive: data.isActive,
        patientCaseClosed: data.patientCaseClosed,
        treatmentPlanId: data.treatmentPlanId,
        treatmentPlanOutcome: data.treatmentPlanOutcome,
        currentTreatmentPlanPhase: data.localTreatmentPlanPhase,
        icdDiagnosticCode: data.icdDiagnosticCode,
        treatmentPlanOutcomeExplanation: data.treatmentPlanOutcomeExplanation);
  }

  String toJson() => json.encode(toMap());

  factory PatientCase.fromJson(String source) =>
      PatientCase.fromMap(json.decode(source) as Map<String, dynamic>);

  PatientCase copyWith({
    int? id,
    DateTime? creationDate,
    int? patientId,
    int? professionalId,
    String? consultationReason,
    String? diagnostic,
    String? icdDiagnosticCode,
    String? treatmentProposal,
    String? caseNotes,
    bool? isActive,
    bool? patientCaseClosed,
    String? treatmentPlanOutcome,
    String? treatmentPlanOutcomeExplanation,
    int? treatmentPlanId,
    int? currentTreatmentPlanPhase,
  }) {
    return PatientCase(
      id: id ?? this.id,
      creationDate: creationDate ?? this.creationDate,
      patientId: patientId ?? this.patientId,
      professionalId: professionalId ?? this.professionalId,
      consultationReason: consultationReason ?? this.consultationReason,
      diagnostic: diagnostic ?? this.diagnostic,
      icdDiagnosticCode: icdDiagnosticCode ?? this.icdDiagnosticCode,
      treatmentProposal: treatmentProposal ?? this.treatmentProposal,
      caseNotes: caseNotes ?? this.caseNotes,
      isActive: isActive ?? this.isActive,
      patientCaseClosed: patientCaseClosed ?? this.patientCaseClosed,
      treatmentPlanOutcome: treatmentPlanOutcome ?? this.treatmentPlanOutcome,
      treatmentPlanOutcomeExplanation: treatmentPlanOutcomeExplanation ??
          this.treatmentPlanOutcomeExplanation,
      treatmentPlanId: treatmentPlanId ?? this.treatmentPlanId,
      currentTreatmentPlanPhase:
          currentTreatmentPlanPhase ?? this.currentTreatmentPlanPhase,
    );
  }

  @override
  String toString() {
    return 'PatientCase(id: $id, creationDate: $creationDate, patientId: $patientId, professionalId: $professionalId, consultationReason: $consultationReason, diagnostic: $diagnostic, icdDiagnosticCode: $icdDiagnosticCode, treatmentProposal: $treatmentProposal, caseNotes: $caseNotes, isActive: $isActive, patientCaseClosed: $patientCaseClosed, treatmentPlanOutcome: $treatmentPlanOutcome, treatmentPlanOutcomeExplanation: $treatmentPlanOutcomeExplanation, treatmentPlanId: $treatmentPlanId, currentTreatmentPlanPhase: $currentTreatmentPlanPhase)';
  }

  @override
  bool operator ==(covariant PatientCase other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.creationDate == creationDate &&
        other.patientId == patientId &&
        other.professionalId == professionalId &&
        other.consultationReason == consultationReason &&
        other.diagnostic == diagnostic &&
        other.icdDiagnosticCode == icdDiagnosticCode &&
        other.treatmentProposal == treatmentProposal &&
        other.caseNotes == caseNotes &&
        other.isActive == isActive &&
        other.patientCaseClosed == patientCaseClosed &&
        other.treatmentPlanOutcome == treatmentPlanOutcome &&
        other.treatmentPlanOutcomeExplanation ==
            treatmentPlanOutcomeExplanation &&
        other.treatmentPlanId == treatmentPlanId &&
        other.currentTreatmentPlanPhase == currentTreatmentPlanPhase;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        creationDate.hashCode ^
        patientId.hashCode ^
        professionalId.hashCode ^
        consultationReason.hashCode ^
        diagnostic.hashCode ^
        icdDiagnosticCode.hashCode ^
        treatmentProposal.hashCode ^
        caseNotes.hashCode ^
        isActive.hashCode ^
        patientCaseClosed.hashCode ^
        treatmentPlanOutcome.hashCode ^
        treatmentPlanOutcomeExplanation.hashCode ^
        treatmentPlanId.hashCode ^
        currentTreatmentPlanPhase.hashCode;
  }
}
