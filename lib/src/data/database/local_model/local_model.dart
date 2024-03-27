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
  LocalAppointmentGroup,
  LocalPatientCompanion,
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

  Future<void> insertAppointmentGroup(LocalAppointmentGroupCompanion data) {
    return into(localAppointmentGroup).insert(data);
  }

  Future<int> insertPatientCompanion(LocalPatientCompanionData data) {
    return into(localPatientCompanion).insert(data);
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

  Future updateLocalUserPassword(String userID, String newEncodedValue) async {
    return (update(localProfessional)..where((t) => t.id.equals(userID))).write(
      LocalProfessionalCompanion(
        password: Value(newEncodedValue),
      ),
    );
  }

  Future updateLocalUserPasswordAndPin(
      String userID, String newEncodedPassword, String newEncodedPin) async {
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

  Future<List<LocalPatientCaseData>> getPatientCases(String patientId) {
    return (select(localPatientCase)
          ..where(
            (tbl) => tbl.patientId.equals(patientId),
          ))
        .get();
  }

  Future<List<LocalPatientCaseData>> getFilteredPatientCases(String patientId) {
    return (select(localPatientCase)
          ..where(
            (tbl) =>
                tbl.patientId.equals(patientId) & tbl.isActive.equals(true),
          ))
        .get();
  }

  Future<LocalPatientCaseData?> getSinglePatientCase(String patientId) {
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
      String patientId) {
    return (select(localClinicHistory)
          ..where((tbl) => tbl.patientId.equals(patientId)))
        .get();
  }

  Future<LocalClinicHistoryData> getSingleClinicHistory(String patientId) {
    return (select(localClinicHistory)
          ..where((tbl) => tbl.patientId.equals(patientId)))
        .getSingle();
  }

  Future<List<LocalSession>> getPatientSessionsList(String patientId) {
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

  Future<List<LocalTreatmentResult>> getTreatmentPlanResults(String patientId) {
    return (select(localTreatmentResults)
          ..where((tbl) => tbl.patientID.equals(patientId)))
        .get();
  }

  Future<LocalPatientCompanionData> getPatientCompanion(String patientId) {
    return (select(localPatientCompanion)
          ..where((tbl) => tbl.id.equals(patientId)))
        .getSingle();
  }

  //Update

  Future updateConfigurationState(bool isConfigured) {
    return (update(settings)..where((t) => t.id.equals(0))).write(
      SettingsCompanion(
        isConfigured: Value(isConfigured),
      ),
    );
  }

  Future updateTodoState(String todoId, bool newState) {
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

  Future updatePatientActiveState(String patientId, bool newState) {
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

  Future updatePatientCasePhase(String caseId, int newPhase) {
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

  Future disactivatePatientCases(String caseId) {
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

  Future activatePatientCases(String caseId) {
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
      String caseId, String outcome, String? outcomeDescription) {
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
      LocalAppointmentsCompanion data, String appointmentId) {
    return (update(localAppointments)
          ..where(
            (tbl) => tbl.id.equals(appointmentId),
          ))
        .write(data);
  }

  //Delete

  Future<int> deleteAppointmentsGroup({required String groupId}) {
    return (delete(localAppointments)
          ..where((tbl) => tbl.groupID.equals(groupId)))
        .go();
  }

  Future deleteLocalEvent(String eventId) {
    return (delete(localAppointments)
          ..where(
            (tbl) => tbl.id.equals(eventId),
          ))
        .go();
  }

  Future deleteLocalTodo(String todoId) {
    return (delete(localTodos)
          ..where(
            (tbl) => tbl.id.equals(todoId),
          ))
        .go();
  }

  Future deleteLocalTreatmentPlan(String treatmentId) {
    return (delete(localTreatmentPlans)
          ..where(
            (tbl) => tbl.id.equals(treatmentId),
          ))
        .go();
  }

  Future deleteLocalClinicHisoty(String patientId) {
    return (delete(localClinicHistory)
          ..where(
            (tbl) => tbl.patientId.equals(patientId),
          ))
        .go();
  }

  Future deleteLocalPatientCase(String id) {
    return (delete(localPatientCase)
          ..where(
            (tbl) => tbl.id.equals(id),
          ))
        .go();
  }

  Future deleteSavedIcdData() {
    return (delete(savedIcdDiagnosticData)).go();
  }

  Future deleteLocalSession(String sessionId) {
    return (delete(localSessions)
          ..where(
            (tbl) => tbl.id.equals(sessionId),
          ))
        .go();
  }

  Future deleteLocalPatient(String patientId) {
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
