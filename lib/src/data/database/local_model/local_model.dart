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
  LocalPatientCase,
  LocalSessions,
  LocalProfessional,
  LocalTests,
  LocalTodos,
  LocalAppointments,
  LocalTreatmentPlans,
  LocalTreatmentResults,
  Settings,
  ServerDatabase,
  SavedIcdDiagnosticData,
])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await into(settings).insert(
            const SettingsCompanion(
              id: Value(0),
              isDarkModeEnabled: Value(false),
              isOfflineModeEnabled: Value(false),
              isConfigured: Value(false),
            ),
          );
        },
        beforeOpen: (details) async {
          if (details.wasCreated) {
            await into(settings).insert(
              const SettingsCompanion(
                id: Value(0),
                isDarkModeEnabled: Value(false),
                isOfflineModeEnabled: Value(false),
                isConfigured: Value(false),
              ),
            );
          }
        },
      );

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

  Future<void> insertTreatmentPlanResult(LocalTreatmentResultsCompanion data) {
    return into(localTreatmentResults).insert(data);
  }

  Future<void> insertPatientCase(LocalPatientCaseCompanion data) {
    return into(localPatientCase).insert(data);
  }

  Future<void> insertIcdDiagnosticData(SavedIcdDiagnosticDataCompanion data) {
    return into(savedIcdDiagnosticData).insert(data);
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

  Future updateLocalUserPasswordAndPin(
      int userID, String newEncodedPassword, String newEncodedPin) async {
    return (update(localProfessional)..where((t) => t.id.equals(userID))).write(
      LocalProfessionalCompanion(
        password: Value(newEncodedPassword),
        encodedRecoverPin: Value(newEncodedPin),
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

  Future<List<LocalPatient>> getPatientsListById(int idNumber) {
    return (select(localPatients)
          ..where(
            (tbl) => tbl.idNumber.equals(idNumber),
          ))
        .get();
  }

  Future<LocalPatient> getSinglePatient(int idNumber) {
    return (select(localPatients)
          ..where(
            (tbl) => tbl.idNumber.equals(idNumber),
          ))
        .getSingle();
  }

  Future<List<LocalPatientCaseData>> getPatientCases(int patientId) {
    return (select(localPatientCase)
          ..where(
            (tbl) => tbl.patientId.equals(patientId),
          ))
        .get();
  }

  Future<List<LocalPatientCaseData>> getFilteredPatientCases(int patientId) {
    return (select(localPatientCase)
          ..where(
            (tbl) =>
                tbl.patientId.equals(patientId) & tbl.isActive.equals(true),
          ))
        .get();
  }

  Future<LocalPatientCaseData?> getSinglePatientCase(int patientId) {
    return (select(localPatientCase)
          ..where(
            (tbl) =>
                tbl.patientId.equals(patientId) & tbl.isActive.equals(true),
          ))
        .getSingleOrNull();
  }

  Future<List<LocalProfessionalData>> getProfessionalsList() {
    return (select(localProfessional)).get();
  }

  Future<List<LocalProfessionalData>> loginProfessional(
    String userName,
  ) {
    return (select(localProfessional)
          ..where(
            (tbl) => tbl.userName.equals(userName),
          ))
        .get();
  }

  Stream<List<LocalProfessionalData>> initalProfessionalFetch() {
    return (select(localProfessional)).watch();
  }

  Stream<Setting> watchCurrentSettings() {
    return (select(settings)..where((tbl) => tbl.id.equals(0))).watchSingle();
  }

  Future<List<LocalClinicHistoryData>> clinicHistoryConsultation(
      int patientId) {
    return (select(localClinicHistory)
          ..where((tbl) => tbl.id.equals(patientId)))
        .get();
  }

  Future<LocalClinicHistoryData> getSingleClinicHistory(int patientId) {
    return (select(localClinicHistory)
          ..where((tbl) => tbl.id.equals(patientId)))
        .getSingle();
  }

  Future<List<LocalSession>> getPatientSessionsList(int patientId) {
    return (select(localSessions)
          ..where(
            (tbl) => tbl.idNumber.equals(patientId),
          ))
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

  Future<List<LocalTreatmentPlan>> getLocalTreatmentPlans() {
    return (select(localTreatmentPlans)).get();
  }

  Future<List<SavedIcdDiagnosticDataData>> getIcdCategories() {
    return (select(savedIcdDiagnosticData)).get();
  }

  Future<List<LocalTreatmentResult>> getTreatmentPlanResults(int patientId) {
    return (select(localTreatmentResults)
          ..where((tbl) => tbl.patientID.equals(patientId)))
        .get();
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

  Future updateTreatmentPlan(LocalTreatmentPlan newData) {
    return (update(localTreatmentPlans)
          ..where(
            (tbl) => tbl.id.equals(newData.id),
          ))
        .write(newData);
  }

  Future updatePatientActiveState(int patientId, bool newState) {
    return (update(localPatients)
          ..where(
            (tbl) => tbl.id.equals(patientId),
          ))
        .write(
      LocalPatientsCompanion(
        isActive: Value(newState),
      ),
    );
  }

  Future updatePatientCasePhase(int caseId, int newPhase) {
    return (update(localPatientCase)
          ..where(
            (tbl) => tbl.id.equals(caseId),
          ))
        .write(
      LocalPatientCaseCompanion(
        localTreatmentPlanPhase: Value(newPhase),
      ),
    );
  }

  Future disactivatePatientCases(int caseId) {
    return (update(localPatientCase)
          ..where(
            (tbl) => tbl.id.equals(caseId),
          ))
        .write(
      const LocalPatientCaseCompanion(
        isActive: Value(false),
      ),
    );
  }

  Future activatePatientCases(int caseId) {
    return (update(localPatientCase)
          ..where(
            (tbl) => tbl.id.equals(caseId),
          ))
        .write(
      const LocalPatientCaseCompanion(
        isActive: Value(true),
      ),
    );
  }

  Future closeCurrentCase(
      int caseId, String outcome, String? outcomeDescription) {
    return (update(localPatientCase)
          ..where(
            (tbl) => tbl.id.equals(caseId),
          ))
        .write(
      LocalPatientCaseCompanion(
        patientCaseClosed: const Value(true),
        treatmentPlanOutcome: Value(outcome),
        treatmentPlanOutcomeExplanation: Value(outcomeDescription),
      ),
    );
  }

  Future updateLocalAppointment(
      LocalAppointmentsCompanion data, int appointmentId) {
    return (update(localAppointments)
          ..where(
            (tbl) => tbl.id.equals(appointmentId),
          ))
        .write(data);
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

  Future deleteLocalTreatmentPlan(int treatmentId) {
    return (delete(localTreatmentPlans)
          ..where(
            (tbl) => tbl.id.equals(treatmentId),
          ))
        .go();
  }

  Future deleteLocalClinicHisoty(int patientId) {
    return (delete(localClinicHistory)
          ..where(
            (tbl) => tbl.patientId.equals(patientId),
          ))
        .go();
  }

  Future deleteLocalPatientCase(int id) {
    return (delete(localPatientCase)
          ..where(
            (tbl) => tbl.id.equals(id),
          ))
        .go();
  }

  Future deleteSavedIcdData() {
    return (delete(savedIcdDiagnosticData)).go();
  }

  Future deleteLocalSession(int sessionId) {
    return (delete(localSessions)
          ..where(
            (tbl) => tbl.id.equals(sessionId),
          ))
        .go();
  }

  Future deleteLocalPatient(int patientId) {
    return (delete(localPatients)
          ..where(
            (tbl) => tbl.id.equals(patientId),
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
