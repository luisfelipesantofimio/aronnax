import 'package:drift/drift.dart';
import 'local_model.dart';

LocalDatabase localDB = LocalDatabase();

addLocalPatient(
  names,
  lastNames,
  birthDate,
  idNumber,
  contactNumber,
  mail,
  city,
  state,
  adress,
  insurance,
  education,
  ocupation,
  emergencyContactName,
  emergencyContactNumber,
) {
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
  );

  localDB.insertPatient(entity);
}

Future<void> addLocalClinicHistory(
  registerCode,
  dateTime,
  consultationReason,
  mentalExamn,
  treatment,
  medAntecedents,
  psiAntecedents,
  familyHistory,
  personalHistory,
  diagnostic,
  idNumber,
  createdBy,
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
    createdBy: Value(createdBy),
  );

  await localDB.insertClinicHistory(entity);
}

addLocalProfessional(int personalID, String names, String lastNames,
    String profession, int professionalID, String userName, String password) {
  final entity = ProfessionalCompanion(
    userName: Value(userName),
    names: Value(names),
    lastNames: Value(lastNames),
    personalID: Value(personalID),
    professionalID: Value(professionalID),
    profession: Value(profession),
    password: Value(password),
  );

  localDB.insertProfessional(entity);
}

Stream<List<Patient>> searchPatient(String user) {
  return localDB.userConsultation(user);
}

Stream<List<ProfessionalData>> loginExistingProfessional(int userID) {
  return localDB.loginProfessional(userID);
}

Stream<List<ProfessionalData>> fetchInitialRegisterUsers() {
  return localDB.initalProfessionalFetch();
}
