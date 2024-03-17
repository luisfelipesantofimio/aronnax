import 'package:drift/drift.dart';

class LocalPatients extends Table {
  TextColumn get id => text()();
  TextColumn get names => text()();
  TextColumn get lastNames => text()();
  IntColumn get idNumber => integer().unique()();
  DateTimeColumn get birthDate => dateTime()();
  IntColumn get contactNumber => integer()();
  TextColumn get mail => text()();
  TextColumn get city => text()();
  TextColumn get state => text()();
  TextColumn get gender => text()();
  TextColumn get adress => text()();
  TextColumn get education => text()();
  TextColumn get ocupation => text()();
  TextColumn get insurance => text()();
  TextColumn get emergencyContactName => text()();
  IntColumn get emergencyContactNumber => integer()();
  DateTimeColumn get creationDate => dateTime()();
  BoolColumn get isActive => boolean()();
  TextColumn get professionalID => text().references(LocalProfessional, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalClinicHistory extends Table {
  TextColumn get id => text()();
  TextColumn get registerNumber => text()();
  DateTimeColumn get currentDate => dateTime()();
  TextColumn get mentalExamination => text()();
  TextColumn get medAntecedents => text()();
  TextColumn get psyAntecedents => text()();
  TextColumn get familyHistory => text()();
  TextColumn get personalHistory => text()();
  TextColumn get patientId => text().references(LocalPatients, #id)();
  TextColumn get professionalID => text().references(LocalProfessional, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalPatientCase extends Table {
  TextColumn get id => text()();
  DateTimeColumn get creationDate => dateTime()();
  TextColumn get patientId => text().references(LocalPatients, #id)();
  TextColumn get professionalId => text().references(LocalProfessional, #id)();
  TextColumn get consultationReason => text()();
  TextColumn get diagnostic => text()();
  TextColumn get icdDiagnosticCode => text().nullable()();
  TextColumn get treatmentProposal => text()();
  TextColumn get caseNotes => text().nullable()();
  BoolColumn get isActive => boolean()();
  BoolColumn get patientCaseClosed => boolean()();

  ///String with a positive, neutral or negative result
  TextColumn get treatmentPlanOutcome => text().nullable()();
  TextColumn get treatmentPlanOutcomeExplanation => text().nullable()();

  TextColumn get treatmentPlanId =>
      text().references(LocalTreatmentPlans, #id).nullable()();

  IntColumn get localTreatmentPlanPhase => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalSessions extends Table {
  TextColumn get id => text()();
  DateTimeColumn get sessionDate => dateTime()();
  TextColumn get sessionSummary => text()();
  TextColumn get sessionObjectives => text()();
  TextColumn get therapeuticArchievements => text()();
  TextColumn get sessionNotes => text().nullable()();
  IntColumn get sessionPerformance => integer()();
  TextColumn get sessionPerformanceExplanation => text().nullable()();
  TextColumn get idNumber => text().references(LocalPatients, #id)();
  TextColumn get professionalID => text().references(LocalProfessional, #id)();
  TextColumn get caseId => text().references(LocalPatientCase, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalProfessional extends Table {
  TextColumn get id => text()();
  IntColumn get personalID => integer()();
  TextColumn get names => text()();
  TextColumn get lastNames => text()();
  TextColumn get email => text()();
  TextColumn get adress => text()();
  TextColumn get countryCode => text()();
  IntColumn get professionalID => integer()();
  TextColumn get userName => text()();
  TextColumn get securityQuestion => text()();
  TextColumn get securityAnswers => text()();
  TextColumn get encodedRecoverPin => text()();
  TextColumn get password => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalTests extends Table {
  TextColumn get id => text()();
  DateTimeColumn get testDate => dateTime()();
  TextColumn get patientID => text().references(LocalPatients, #id)();
  IntColumn get professionalID =>
      integer().references(LocalProfessional, #id)();
  TextColumn get sessionID => text().references(LocalSessions, #id)();
  TextColumn get testReason => text()();
  TextColumn get category => text()();
  TextColumn get testData => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalTodos extends Table {
  TextColumn get id => text()();
  DateTimeColumn get creationDate => dateTime()();
  TextColumn get todo => text()();
  TextColumn get description => text().nullable()();
  TextColumn get category => text().nullable()();
  IntColumn get itemColor => integer()();
  BoolColumn get isComplete => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalAppointments extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get professionalID => text().references(LocalProfessional, #id)();
  TextColumn get patientID => text().references(LocalPatients, #id)();
  TextColumn get description => text().nullable()();
  TextColumn get status => text()();
  TextColumn get sessionType => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalTreatmentPlans extends Table {
  TextColumn get id => text()();
  DateTimeColumn get creationDate => dateTime()();
  TextColumn get treatmentTitle => text()();
  TextColumn get treatmentDescription => text()();
  TextColumn get treatmentData => text()();
  TextColumn get professionalID => text().references(LocalProfessional, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalTreatmentResults extends Table {
  TextColumn get id => text()();
  IntColumn get sessionNumber => integer()();
  DateTimeColumn get applicationDate => dateTime()();
  TextColumn get patientID => text().references(LocalPatients, #id)();
  TextColumn get professionalID => text().references(LocalProfessional, #id)();
  IntColumn get phaseNumber => integer()();
  TextColumn get treatmentPlanID =>
      text().references(LocalTreatmentPlans, #id)();
  TextColumn get patientCaseId => text().references(LocalPatientCase, #id)();
  TextColumn get treatmentResultsData => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class SavedIcdDiagnosticData extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get icdRelease => text()();
  TextColumn get definition => text().nullable()();
  TextColumn get categoryData => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Settings extends Table {
  IntColumn get id => integer()();
  BoolColumn get isDarkModeEnabled => boolean()();
  BoolColumn get isOfflineModeEnabled => boolean()();
  BoolColumn get isConfigured => boolean()();
  @override
  Set<Column> get primaryKey => {id};
}

class ServerDatabase extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userName => text()();
  TextColumn get password => text()();
  TextColumn get server => text()();
  IntColumn get port => integer()();
  TextColumn get databaseName => text()();
}
