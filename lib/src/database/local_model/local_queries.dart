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

addLocalClinicHistory(
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
) {
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

  localDB.insertClinicHistory(entity);
}

addLocalSession() {}

searchPatient(String user) {
  localDB.userConsultation(user);
}
