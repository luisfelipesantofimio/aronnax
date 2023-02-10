import 'dart:io';
import 'package:aronnax/src/data/database/local_model/tables.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';

part 'local_model.g.dart';

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

  //Data insertion

  Future<void> insertPatient(PatientsCompanion data) {
    return into(patients).insert(data);
  }

  Future<void> insertClinicHistory(ClinicHistoryCompanion data) {
    return into(clinicHistory).insert(data);
  }

  Future<void> insertSession(SessionsCompanion data) {
    return into(sessions).insert(data);
  }

  Future<void> insertSettings(SettingsCompanion data) {
    return into(settings).insert(data);
  }

  Future<void> insertProfessional(ProfessionalCompanion data) {
    return into(professional).insert(data);
  }

  Future<void> insertDatabaseAccess(ServerDatabaseCompanion data) {
    return into(serverDatabase).insert(data);
  }

  // Data update

  Future updateThemeMode(bool currentThemeMode) async {
    return (update(settings)..where((t) => t.id.equals(0))).write(
      SettingsCompanion(
        isDarkModeEnabled: Value(!currentThemeMode),
      ),
    );
  }

  Future updateConnectionMode(bool currentConnectionMode) async {
    return (update(settings)..where((t) => t.id.equals(0))).write(
      SettingsCompanion(
        isOfflineModeEnabled: Value(currentConnectionMode),
      ),
    );
  }

  Future updateLocalUserPassword(int userID, String newEncodedValue) async {
    return (update(professional)..where((t) => t.id.equals(userID))).write(
      ProfessionalCompanion(
        password: Value(newEncodedValue),
      ),
    );
  }

  // Data fetching

  Stream<List<Patient>> userConsultation(String userNames) {
    return (select(patients)
          ..where(
            (tbl) => tbl.names.contains(userNames),
          ))
        .watch();
  }

  Future<List<ProfessionalData>> getProfessionalsList() {
    return (select(professional)).get();
  }

  Future<List<ProfessionalData>> loginProfessional(int userID) {
    return (select(professional)
          ..where(
            (tbl) => tbl.personalID.equals(userID),
          ))
        .get();
  }

  Stream<List<ProfessionalData>> initalProfessionalFetch() {
    return (select(professional)).watch();
  }

  Stream<Setting> watchCurrentSettings() {
    return (select(settings)..where((tbl) => tbl.id.equals(0))).watchSingle();
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

  Future<Setting?> verifyExistingSettings() {
    return (select(settings)..where((tbl) => tbl.id.equals(0)))
        .getSingleOrNull();
  }

  Future<Setting> getLocalSettings() {
    return (select(settings)..where((tbl) => tbl.id.equals(0))).getSingle();
  }

  Future<List<ServerDatabaseData>> getServerConfigurations() {
    return (select(serverDatabase)).get();
  }

  Future updateConfigurationState(bool isConfigured) {
    return (update(settings)..where((t) => t.id.equals(0))).write(
      SettingsCompanion(
        isConfigured: Value(isConfigured),
      ),
    );
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
