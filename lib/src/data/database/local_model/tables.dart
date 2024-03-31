import 'package:drift/drift.dart';

/// Represents the reason the patient requieres the companion
enum CompanionReason {
  disabled,
  underage,
  other,
}

/// Represents the relationship of the companion
enum CompanionRelationship {
  friend,
  parent,
  relative,
  partner,
  other,
}

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
  TextColumn get companionId =>
      text().nullable().references(LocalPatientCompanion, #id)();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalPatientCompanion extends Table {
  TextColumn get id => text()();
  TextColumn get names => text()();
  TextColumn get lastNames => text()();
  IntColumn get idNumber => integer().unique().nullable()();
  DateTimeColumn get birthDate => dateTime().nullable()();
  IntColumn get contactNumber => integer().nullable()();
  TextColumn get mail => text().nullable()();
  TextColumn get relationshipp => textEnum<CompanionRelationship>()
      .clientDefault(() => CompanionRelationship.other.toString())();
  TextColumn get companionReason => textEnum<CompanionReason>()
      .clientDefault(() => CompanionReason.other.toString())();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now()).nullable()();
  BoolColumn get isActive => boolean().clientDefault(() => true)();

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
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

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

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

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
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

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
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

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
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

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
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

class LocalAppointmentGroup extends Table {
  TextColumn get id => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

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
  TextColumn get groupID =>
      text().references(LocalAppointmentGroup, #id).nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

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
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now()).nullable()();

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
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

class SavedIcdDiagnosticData extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get icdRelease => text()();
  TextColumn get definition => text().nullable()();
  TextColumn get categoryData => text()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

class Settings extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isDarkModeEnabled => boolean()();
  BoolColumn get isOfflineModeEnabled => boolean()();
  BoolColumn get isConfigured => boolean()();
}

class ServerDatabase extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userName => text()();
  TextColumn get password => text()();
  TextColumn get server => text()();
  IntColumn get port => integer()();
  TextColumn get databaseName => text()();
}
