import 'package:drift/drift.dart';

class LocalPatients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get names => text()();
  TextColumn get lastNames => text()();
  IntColumn get idNumber => integer().unique()();
  DateTimeColumn get birthDate => dateTime()();
  IntColumn get contactNumber => integer()();
  TextColumn get mail => text()();
  TextColumn get city => text()();
  TextColumn get state => text()();
  TextColumn get adress => text()();
  TextColumn get education => text()();
  TextColumn get ocupation => text()();
  TextColumn get insurance => text()();
  TextColumn get emergencyContactName => text()();
  IntColumn get emergencyContactNumber => integer()();
  DateTimeColumn get creationDate => dateTime()();
  BoolColumn get isActive => boolean()();
  IntColumn get professionalID =>
      integer().references(LocalProfessional, #professionalID)();
}

class LocalClinicHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get registerNumber => text()();
  DateTimeColumn get currentDate => dateTime()();
  TextColumn get consultationReason => text()();
  TextColumn get mentalExamination => text()();
  TextColumn get treatment => text()();
  TextColumn get medAntecedents => text()();
  TextColumn get psiAntecedents => text()();
  TextColumn get familyHistory => text()();
  TextColumn get personalHistory => text()();
  TextColumn get diagnostic => text()();
  IntColumn get idNumber => integer().references(LocalPatients, #idNumber)();
  IntColumn get professionalID =>
      integer().references(LocalProfessional, #professionalID)();
}

class LocalSessions extends Table {
  IntColumn get sessionId => integer().autoIncrement()();
  DateTimeColumn get sessionDate => dateTime()();
  TextColumn get sessionSummary => text()();
  TextColumn get sessionObjectives => text()();
  TextColumn get therapeuticArchievements => text()();
  TextColumn get sessionNotes => text().nullable()();
  TextColumn get sessionPerformance => text()();
  TextColumn get sessionPerformanceExplanation => text().nullable()();
  IntColumn get idNumber => integer().references(LocalPatients, #idNumber)();
  IntColumn get professionalID =>
      integer().references(LocalProfessional, #professionalID)();
}

class LocalProfessional extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get personalID => integer().unique()();
  TextColumn get names => text()();
  TextColumn get lastNames => text()();
  TextColumn get countryCode => text()();
  IntColumn get professionalID => integer()();
  TextColumn get userName => text()();
  TextColumn get password => text()();
}

class LocalTests extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get testDate => dateTime()();
  IntColumn get patientID => integer().references(LocalPatients, #idNumber)();
  IntColumn get professionalID =>
      integer().references(LocalProfessional, #professionalID)();
  IntColumn get sessionID => integer().references(LocalSessions, #sessionId)();
  TextColumn get testReason => text()();
  TextColumn get category => text()();
  TextColumn get testData => text()();
}

class LocalTodos extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get creationDate => dateTime()();
  TextColumn get todo => text()();
  TextColumn get description => text().nullable()();
  TextColumn get category => text().nullable()();
  IntColumn get itemColor => integer()();
  BoolColumn get isComplete => boolean()();
}

class LocalAppointments extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get professionalID =>
      integer().references(LocalProfessional, #professionalID)();
  IntColumn get patientID => integer().references(LocalPatients, #idNumber)();
  TextColumn get description => text().nullable()();
  TextColumn get status => text()();
  TextColumn get sessionType => text()();
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
