// class implemented on remote SQL data fetching for clinic history

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
  final String createdBy;
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
    required this.createdBy,
  });

  factory RemoteClinicHistory.fromJson(Map<String, dynamic> data) {
    final registerCode = data["registerCode"] as String?;
    final dateTime = data["dateTime"] as String?;
    final consultationReason = data["consultationReason"] as String?;
    final mentalExamn = data["mentalExamn"] as String?;
    final treatment = data["treatment"] as String?;
    final medAntecedents = data["medAntecedents"] as String?;
    final psyAntecedents = data["psiAntecedents"] as String?;
    final familyHistory = data["familyHistory"] as String?;
    final personalHistory = data["personalHistory"] as String?;
    final diagnostic = data["diagnostic"] as String?;
    final idNumber = data["idNumber"] as int?;
    final createdBy = data["createdBy"] as String?;
    return RemoteClinicHistory(
        registerCode: registerCode!,
        dateTime: dateTime!,
        consultationReason: consultationReason!,
        mentalExamn: mentalExamn!,
        treatment: treatment!,
        medAntecedents: medAntecedents!,
        psyAntecedents: psyAntecedents!,
        familyHistory: familyHistory!,
        personalHistory: personalHistory!,
        diagnostic: diagnostic!,
        idNumber: idNumber!,
        createdBy: createdBy!);
  }
}
