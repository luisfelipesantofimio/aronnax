import 'dart:io';
import 'package:aronnax/src/data/database/local_model/tables.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';

part 'local_model.g.dart';

@DriftDatabase(tables: [
  LocalPatients,
  LocalClinicHistory,
  LocalSessions,
  LocalProfessional,
  LocalTests,
  LocalTodos,
  LocalAppointments,
  LocalTreatmentPlans,
  LocaltreatmentResults,
  Settings,
  ServerDatabase
])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //Data insertion

  Future<void> insertPatient(LocalPatientsCompanion data) {
    return into(localPatients).insert(data);
  }

  Future<void> insertClinicHistory(LocalClinicHistoryCompanion data) {
    return into(localClinicHistory).insert(data);
  }

  Future<void> insertSession(LocalSessionsCompanion data) {
    return into(localSessions).insert(data);
  }

  Future<void> insertSettings(SettingsCompanion data) {
    return into(settings).insert(data);
  }

  Future<void> insertProfessional(LocalProfessionalCompanion data) {
    return into(localProfessional).insert(data);
  }

  Future<void> insertDatabaseAccess(ServerDatabaseCompanion data) {
    return into(serverDatabase).insert(data);
  }

  Future<void> insertTodo(LocalTodosCompanion data) {
    return into(localTodos).insert(data);
  }

  Future<void> insertAppointment(LocalAppointmentsCompanion data) {
    return into(localAppointments).insert(data);
  }

  Future<void> insertTreatmentPlan(LocalTreatmentPlansCompanion data) {
    return into(localTreatmentPlans).insert(data);
  }

  Future<void> insertTreatmentPlanResult(LocaltreatmentResultsCompanion data) {
    return into(localtreatmentResults).insert(data);
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
    return (update(localProfessional)..where((t) => t.id.equals(userID))).write(
      LocalProfessionalCompanion(
        password: Value(newEncodedValue),
      ),
    );
  }

  // Data read

  Future<List<LocalPatient>> userConsultation(String userNames) {
    return (select(localPatients)
          ..where(
            (tbl) => tbl.names.contains(userNames),
          ))
        .get();
  }

  Future<List<LocalPatient>> getPatientsList() {
    return (select(localPatients)).get();
  }

  Future<List<LocalProfessionalData>> getProfessionalsList() {
    return (select(localProfessional)).get();
  }

  Future<List<LocalProfessionalData>> loginProfessional(int userID) {
    return (select(localProfessional)
          ..where(
            (tbl) => tbl.personalID.equals(userID),
          ))
        .get();
  }

  Stream<List<LocalProfessionalData>> initalProfessionalFetch() {
    return (select(localProfessional)).watch();
  }

  Stream<Setting> watchCurrentSettings() {
    return (select(settings)..where((tbl) => tbl.id.equals(0))).watchSingle();
  }

  Future<List<LocalClinicHistoryData>> clinicHistoryConsultation(int idNumber) {
    return (select(localClinicHistory)
          ..where((tbl) => tbl.idNumber.equals(idNumber)))
        .get();
  }

  Future<List<LocalSession>> sessionsConsultation(int idNumber) {
    return (select(localSessions)
          ..where((tbl) => tbl.idNumber.equals(idNumber)))
        .get();
  }

  Future<Setting?> verifyExistingSettings() {
    return (select(settings)..where((tbl) => tbl.id.equals(0)))
        .getSingleOrNull();
  }

  Future<Setting> getLocalSettings() {
    return (select(settings)..where((tbl) => tbl.id.equals(0))).getSingle();
  }

  Future<List<LocalAppointment>> getLocalAppointments() {
    return (select(localAppointments)).get();
  }

  Future<List<ServerDatabaseData>> getServerConfigurations() {
    return (select(serverDatabase)).get();
  }

  Future<List<LocalTodo>> getLocalTodos() {
    return (select(localTodos)).get();
  }

  //Update

  Future updateConfigurationState(bool isConfigured) {
    return (update(settings)..where((t) => t.id.equals(0))).write(
      SettingsCompanion(
        isConfigured: Value(isConfigured),
      ),
    );
  }

  Future updateTodoState(int todoId, bool newState) {
    return (update(localTodos)..where((tbl) => tbl.id.equals(todoId))).write(
      LocalTodosCompanion(
        isComplete: Value(newState),
      ),
    );
  }

  //Delete

  Future deleteLocalEvent(int eventId) {
    return (delete(localAppointments)
          ..where(
            (tbl) => tbl.id.equals(eventId),
          ))
        .go();
  }

  Future deleteLocalTodo(int todoId) {
    return (delete(localTodos)
          ..where(
            (tbl) => tbl.id.equals(todoId),
          ))
        .go();
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
