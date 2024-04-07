import 'package:drift/drift.dart';
import 'local_model.dart';

LocalDatabase localDB = LocalDatabase();

Future<void> addLocalSession({
  required String sessionSummary,
  required String sessionObjectives,
  required String therapeuticArchievements,
  required String idNumber,
  required String professionalID,
  required DateTime sessionDate,
  required String caseId,
  required String? sessionNotes,
  required int sessionPerformance,
  required String? sessionPerformanceExplanation,
}) async {
  final entity = LocalSessionsCompanion(
    caseId: Value(caseId),
    sessionNotes: Value(sessionNotes),
    sessionPerformance: Value(sessionPerformance),
    sessionPerformanceExplanation: Value(sessionPerformanceExplanation),
    idNumber: Value(idNumber),
    professionalID: Value(professionalID),
    sessionDate: Value(sessionDate),
    sessionObjectives: Value(sessionObjectives),
    sessionSummary: Value(sessionSummary),
    therapeuticArchievements: Value(therapeuticArchievements),
  );
  await localDB.insertSession(entity);
}

addLocalProfessional(int personalID, String names, String lastNames,
    int professionalID, String userName, String password, String cuntryCode) {
  final entity = LocalProfessionalCompanion(
    countryCode: Value(cuntryCode),
    userName: Value(userName),
    names: Value(names),
    lastNames: Value(lastNames),
    personalID: Value(personalID),
    professionalID: Value(professionalID),
    password: Value(password),
  );

  localDB.insertProfessional(entity);
}

void updateThemeMode(bool currentThemeMode) {
  localDB.updateThemeMode(currentThemeMode);
}

void updateConnectionMode(bool currentConnectionMode) {
  localDB.updateConnectionMode(currentConnectionMode);
}

void updateLocalUserPassword(String userID, String newEncodedValue) {
  localDB.updateLocalUserPassword(userID, newEncodedValue);
}

void updateLocalUserPasswordAndPin(
    String userID, String newEncodedValue, String newEncodedPin) {
  localDB.updateLocalUserPasswordAndPin(userID, newEncodedValue, newEncodedPin);
}

Future<List<LocalPatient>> searchPatient(String user) {
  return localDB.userConsultation(user);
}

Future<List<LocalProfessionalData>> loginExistingProfessional(
  String userName,
) {
  return localDB.loginProfessional(userName);
}

Stream<List<LocalProfessionalData>> fetchInitialRegisterUsers() {
  return localDB.initalProfessionalFetch();
}
