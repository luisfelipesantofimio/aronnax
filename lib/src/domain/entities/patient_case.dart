import 'dart:convert';
import 'package:aronnax/src/data/database/local_model/local_model.dart';

class PatientCase {
  final int id;
  final DateTime creationDate;
  final int patientId;
  final int professionalId;
  final String consultationReason;
  final String diagnostic;
  final String treatmentProposal;
  final String? caseNotes;
  final bool isActive;
  PatientCase({
    required this.id,
    required this.creationDate,
    required this.patientId,
    required this.professionalId,
    required this.consultationReason,
    required this.diagnostic,
    required this.treatmentProposal,
    this.caseNotes,
    required this.isActive,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'creationDate': creationDate.millisecondsSinceEpoch,
      'patientId': patientId,
      'professionalId': professionalId,
      'consultationReason': consultationReason,
      'diagnostic': diagnostic,
      'treatmentProposal': treatmentProposal,
      'caseNotes': caseNotes,
      'isActive': isActive,
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
      treatmentProposal: map['treatmentProposal'] as String,
      caseNotes: map['caseNotes'] != null ? map['caseNotes'] as String : null,
      isActive: map['isActive'] as bool,
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
    );
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
    String? treatmentProposal,
    String? caseNotes,
    bool? isActive,
  }) {
    return PatientCase(
      id: id ?? this.id,
      creationDate: creationDate ?? this.creationDate,
      patientId: patientId ?? this.patientId,
      professionalId: professionalId ?? this.professionalId,
      consultationReason: consultationReason ?? this.consultationReason,
      diagnostic: diagnostic ?? this.diagnostic,
      treatmentProposal: treatmentProposal ?? this.treatmentProposal,
      caseNotes: caseNotes ?? this.caseNotes,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  String toString() {
    return 'PatientCase(id: $id, creationDate: $creationDate, patientId: $patientId, professionalId: $professionalId, consultationReason: $consultationReason, diagnostic: $diagnostic, treatmentProposal: $treatmentProposal, caseNotes: $caseNotes, isActive: $isActive)';
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
        other.treatmentProposal == treatmentProposal &&
        other.caseNotes == caseNotes &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        creationDate.hashCode ^
        patientId.hashCode ^
        professionalId.hashCode ^
        consultationReason.hashCode ^
        diagnostic.hashCode ^
        treatmentProposal.hashCode ^
        caseNotes.hashCode ^
        isActive.hashCode;
  }
}
