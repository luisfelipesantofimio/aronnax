import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';

part 'local_model.g.dart';

class Patients extends Table {
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
      integer().references(Professional, #professionalID)();
}

class ClinicHistory extends Table {
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
  IntColumn get idNumber => integer().references(Patients, #idNumber)();
  IntColumn get professionalID =>
      integer().references(Professional, #professionalID)();
}

class Sessions extends Table {
  IntColumn get sessionId => integer().autoIncrement()();
  DateTimeColumn get sessionDate => dateTime()();
  TextColumn get sessionSummary => text()();
  TextColumn get sessionObjectives => text()();
  TextColumn get therapeuticArchievements => text()();
  TextColumn get sessionNotes => text()();
  TextColumn get sessionPerformance => text()();
  IntColumn get idNumber => integer().references(Patients, #idNumber)();
  IntColumn get professionalID =>
      integer().references(Professional, #professionalID)();
}

class Professional extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get personalID => integer().unique()();
  TextColumn get names => text()();
  TextColumn get lastNames => text()();
  IntColumn get professionalID => integer()();
  TextColumn get userName => text()();
  TextColumn get password => text()();
}

class Tests extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get testDate => dateTime()();
  IntColumn get patientID => integer().references(Patients, #idNumber)();
  IntColumn get professionalID =>
      integer().references(Professional, #professionalID)();
  IntColumn get sessionID => integer().references(Sessions, #sessionId)();
  TextColumn get testDescription => text()();
  TextColumn get category => text()();
  TextColumn get testData => text()();
}

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get creationDate => dateTime()();
  TextColumn get todo => text()();
  BoolColumn get isComplete => boolean()();
  IntColumn get sessionID => integer().references(Sessions, #sessionId)();
}

class Appointments extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get professionalID =>
      integer().references(Professional, #professionalID)();
  IntColumn get patientID => integer().references(Patients, #idNumber)();
  TextColumn get description => text()();
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

@DriftDatabase(tables: [
  Patients,
  ClinicHistory,
  Sessions,
  Professional,
  Tests,
  Settings,
  ServerDatabase
])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> insertPatient(PatientsCompanion data) {
    return into(patients).insert(data);
  }

  Future<void> insertClinicHistory(ClinicHistoryCompanion data) {
    return into(clinicHistory).insert(data);
  }

  Future<void> insertSession(SessionsCompanion data) {
    return into(sessions).insert(data);
  }

  Future<void> insertProfessional(ProfessionalCompanion data) {
    return into(professional).insert(data);
  }

  Stream<List<Patient>> userConsultation(String userNames) {
    return (select(patients)
          ..where(
            (tbl) => tbl.names.contains(userNames),
          ))
        .watch();
  }

  Stream<List<ProfessionalData>> loginProfessional(int userID) {
    return (select(professional)
          ..where(
            (tbl) => tbl.personalID.equals(userID),
          ))
        .watch();
  }

  Stream<List<ProfessionalData>> initalProfessionalFetch() {
    return (select(professional)).watch();
  }

  Future<List<ClinicHistoryData>> clinicHistoryConsultation(int idNumber) {
    return (select(clinicHistory)
          ..where((tbl) => tbl.idNumber.equals(idNumber)))
        .get();
  }

  Future<List<Session>> sessionsConsultation(int idNumber) {
    return (select(sessions)..where((tbl) => tbl.idNumber.equals(idNumber)))
        .get();
  }

  Future<List<ProfessionalData>> isProfessionalsListEmpty() async {
    return (select(professional)).get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(
      p.join(dbFolder.path, 'aronnax/aronnax_localDB.sqlite'),
    );
    return NativeDatabase(file);
  });
}
