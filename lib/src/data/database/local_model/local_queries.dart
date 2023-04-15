import 'package:drift/drift.dart';
import 'local_model.dart';

LocalDatabase localDB = LocalDatabase();

Future<void> addLocalSession(
  String sessionSummary,
  String sessionObjectives,
  String therapeuticArchievements,
  int idNumber,
  int professionalID,
  DateTime sessionDate,
) async {
  final entity = LocalSessionsCompanion(
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

void updateLocalUserPassword(int userID, String newEncodedValue) {
  localDB.updateLocalUserPassword(userID, newEncodedValue);
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
