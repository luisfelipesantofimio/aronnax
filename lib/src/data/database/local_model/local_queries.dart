import 'package:drift/drift.dart';
import 'local_model.dart';

LocalDatabase localDB = LocalDatabase();

addLocalPatient({
  required String names,
  required String lastNames,
  required DateTime birthDate,
  required int idNumber,
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
  final entity = PatientsCompanion(
      names: Value(names),
      lastNames: Value(lastNames),
      birthDate: Value(birthDate),
      idNumber: Value(idNumber),
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
  String consultationReason,
  String mentalExamn,
  String treatment,
  String medAntecedents,
  String psiAntecedents,
  String familyHistory,
  String personalHistory,
  String diagnostic,
  int idNumber,
  int professionalID,
) async {
  final entity = ClinicHistoryCompanion(
    registerNumber: Value(registerCode),
    currentDate: Value(dateTime),
    consultationReason: Value(consultationReason),
    mentalExamination: Value(mentalExamn),
    medAntecedents: Value(medAntecedents),
    psiAntecedents: Value(psiAntecedents),
    familyHistory: Value(familyHistory),
    personalHistory: Value(personalHistory),
    diagnostic: Value(diagnostic),
    treatment: Value(treatment),
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
  final entity = SessionsCompanion(
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
  final entity = ProfessionalCompanion(
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

Future<List<Patient>> searchPatient(String user) {
  return localDB.userConsultation(user);
}

Future<List<ProfessionalData>> loginExistingProfessional(int userID) {
  return localDB.loginProfessional(userID);
}

Stream<List<ProfessionalData>> fetchInitialRegisterUsers() {
  return localDB.initalProfessionalFetch();
}
