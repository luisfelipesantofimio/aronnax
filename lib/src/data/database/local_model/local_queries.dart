import 'package:drift/drift.dart';
import 'local_model.dart';

LocalDatabase localDB = LocalDatabase();

addLocalPatient({
  required String names,
  required String lastNames,
  required DateTime birthDate,
  required int idNumber,
  required String gender,
  required int contactNumber,
  required String mail,
  required String city,
  required String state,
  required String adress,
  required String insurance,
  required String education,
  required String ocupation,
  required String emergencyContactName,
  required int emergencyContactNumber,
  required DateTime creationDate,
  required int professionalID,
}) {
  final entity = LocalPatientsCompanion(
      names: Value(names),
      lastNames: Value(lastNames),
      birthDate: Value(birthDate),
      idNumber: Value(idNumber),
      gender: Value(gender),
      contactNumber: Value(contactNumber),
      mail: Value(mail),
      city: Value(city),
      state: Value(state),
      adress: Value(adress),
      insurance: Value(insurance),
      education: Value(education),
      ocupation: Value(ocupation),
      emergencyContactName: Value(emergencyContactName),
      emergencyContactNumber: Value(emergencyContactNumber),
      isActive: const Value(true),
      creationDate: Value(creationDate),
      professionalID: Value(professionalID));

  localDB.insertPatient(entity);
}

Future<void> addLocalClinicHistory(
  String registerCode,
  DateTime dateTime,
  String mentalExamn,
  String medAntecedents,
  String psiAntecedents,
  String familyHistory,
  String personalHistory,
  int idNumber,
  int professionalID,
) async {
  final entity = LocalClinicHistoryCompanion(
    registerNumber: Value(registerCode),
    currentDate: Value(dateTime),
    mentalExamination: Value(mentalExamn),
    medAntecedents: Value(medAntecedents),
    psyAntecedents: Value(psiAntecedents),
    familyHistory: Value(familyHistory),
    personalHistory: Value(personalHistory),
    idNumber: Value(idNumber),
    professionalID: Value(professionalID),
  );

  await localDB.insertClinicHistory(entity);
}

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

Future<List<LocalProfessionalData>> loginExistingProfessional(int userID) {
  return localDB.loginProfessional(userID);
}

Stream<List<LocalProfessionalData>> fetchInitialRegisterUsers() {
  return localDB.initalProfessionalFetch();
}
