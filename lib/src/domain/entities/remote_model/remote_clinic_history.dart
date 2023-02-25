// class implemented on remote SQL data fetching for clinic history

import 'package:mysql1/mysql1.dart';

class RemoteClinicHistory {
  final String registerCode;
  final String dateTime;
  final String consultationReason;
  final String mentalExamn;
  final String treatment;
  final String medAntecedents;
  final String psyAntecedents;
  final String familyHistory;
  final String personalHistory;
  final String diagnostic;
  final int idNumber;
  final int professionalID;
  RemoteClinicHistory({
    required this.registerCode,
    required this.dateTime,
    required this.consultationReason,
    required this.mentalExamn,
    required this.treatment,
    required this.medAntecedents,
    required this.psyAntecedents,
    required this.familyHistory,
    required this.personalHistory,
    required this.diagnostic,
    required this.idNumber,
    required this.professionalID,
  });

  factory RemoteClinicHistory.fromJson(Map<String, dynamic> data) {
    final registerCode = data["registerCode"] as String?;
    final dateTime = data["dateTime"] as String?;
    final consultationReason = data["consultationReason"] as Blob?;
    final mentalExamn = data["mentalExamn"] as Blob?;
    final treatment = data["treatment"] as Blob?;
    final medAntecedents = data["medAntecedents"] as Blob?;
    final psyAntecedents = data["psiAntecedents"] as Blob?;
    final familyHistory = data["familyHistory"] as Blob?;
    final personalHistory = data["personalHistory"] as Blob?;
    final diagnostic = data["diagnostic"] as Blob?;
    final idNumber = data["idNumber"] as int?;
    final professionalID = data["createdBy"] as int?;
    return RemoteClinicHistory(
        registerCode: registerCode!,
        dateTime: dateTime!,
        consultationReason: consultationReason!.toString(),
        mentalExamn: mentalExamn!.toString(),
        treatment: treatment!.toString(),
        medAntecedents: medAntecedents!.toString(),
        psyAntecedents: psyAntecedents!.toString(),
        familyHistory: familyHistory!.toString(),
        personalHistory: personalHistory!.toString(),
        diagnostic: diagnostic!.toString(),
        idNumber: idNumber!,
        professionalID: professionalID!);
  }
}
