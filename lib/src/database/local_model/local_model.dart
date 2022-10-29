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
  TextColumn get birthDate => text()();
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
}

class ClinicHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get registerNumber => text()();
  TextColumn get currentDate => text()();
  TextColumn get consultationReason => text()();
  TextColumn get mentalExamination => text()();
  TextColumn get treatment => text()();
  TextColumn get medAntecedents => text()();
  TextColumn get psiAntecedents => text()();
  TextColumn get familyHistory => text()();
  TextColumn get personalHistory => text()();
  TextColumn get diagnostic => text()();
  IntColumn get idNumber => integer().references(Patients, #idNumber)();
  TextColumn get createdBy => text()();
}

class Sessions extends Table {
  IntColumn get sessionId => integer().autoIncrement()();
  TextColumn get sessionDate => text()();
  TextColumn get sessionSummary => text()();
  TextColumn get sessionObjectives => text()();
  TextColumn get therapeuticArchievements => text()();
  IntColumn get idNumber => integer().references(ClinicHistory, #idNumber)();
  TextColumn get professionalName => text()();
}

class Professional extends Table {
  IntColumn get personalID => integer().unique()();
  TextColumn get names => text()();
  TextColumn get lastNames => text()();
  TextColumn get profession => text()();
  IntColumn get professionalID => integer()();
  TextColumn get userName => text()();
  TextColumn get password => text()();

  @override
  Set<Column> get primaryKey => {professionalID};
}

@DriftDatabase(tables: [Patients, ClinicHistory, Sessions, Professional])
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
            (tbl) => tbl.names.equals(userNames),
          ))
        .watch();
  }

  Stream<List<ClinicHistoryData>> clinicHistoryConsultation(String userNames) {
    final patientInClinicHistory = alias(clinicHistory, "clinicHistoryPatient");
    final query = select(patientInClinicHistory).join([
      innerJoin(
        clinicHistory,
        clinicHistory.idNumber.equalsExp(patients.idNumber),
        useColumns: false,
      ),
      innerJoin(
        patients,
        patients.idNumber.equalsExp(patientInClinicHistory.idNumber),
        useColumns: false,
      ),
    ])
      ..where(
        patients.names.equals(userNames),
      );
    return query.map((row) => row.readTable(patientInClinicHistory)).watch();
  }

  Stream<List<Session>> patientSessionsConsultation(String userNames) {
    final patientSessions = alias(sessions, "clinicHistoryPatient");
    final query = select(patientSessions).join([
      innerJoin(
        sessions,
        sessions.idNumber.equalsExp(patients.idNumber),
        useColumns: false,
      ),
      innerJoin(
        patients,
        patients.idNumber.equalsExp(patientSessions.idNumber),
        useColumns: false,
      ),
    ])
      ..where(
        patients.names.equals(userNames),
      );
    return query.map((row) => row.readTable(patientSessions)).watch();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(
      p.join(dbFolder.path, 'aronnax_localDB.sqlite'),
    );
    return NativeDatabase(file);
  });
}
