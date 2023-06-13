import 'dart:convert';
import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/remote_database/server_api.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class DatabaseRepository implements LocalDatabaseInteface {
  LocalDatabase localDB = LocalDatabase();

  @override
  addLocalPatient({
    required String names,
    required String lastNames,
    required DateTime birthDate,
    required String gender,
    required int idNumber,
    required int contactNumber,
    required String mail,
    required String city,
    required String state,
    required String adress,
    required String insurance,
    required String education,
    required String ocupation,
    required String emergencyContactName,
    required int emergencyContactNumber,
    required DateTime creationDate,
    required int professionalID,
  }) {
    final entity = LocalPatientsCompanion(
        names: Value(names),
        lastNames: Value(lastNames),
        birthDate: Value(birthDate),
        gender: Value(gender),
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
        isActive: const Value(true),
        creationDate: Value(creationDate),
        professionalID: Value(professionalID));

    localDB.insertPatient(entity);
  }

  @override
  Future<void> addLocalClinicHistory(
    String registerCode,
    DateTime dateTime,
    String mentalExamn,
    String medAntecedents,
    String psiAntecedents,
    String familyHistory,
    String personalHistory,
    int idNumber,
    int professionalID,
  ) async {
    final entity = LocalClinicHistoryCompanion(
      registerNumber: Value(registerCode),
      currentDate: Value(dateTime),
      mentalExamination: Value(mentalExamn),
      medAntecedents: Value(medAntecedents),
      psyAntecedents: Value(psiAntecedents),
      familyHistory: Value(familyHistory),
      personalHistory: Value(personalHistory),
      patientId: Value(idNumber),
      professionalID: Value(professionalID),
    );

    await localDB.insertClinicHistory(entity);
  }

  @override
  Future<void> addLocalSession(
    String sessionSummary,
    String sessionObjectives,
    String therapeuticArchievements,
    int idNumber,
    int professionalID,
    DateTime sessionDate,
    String sessionNotes,
    int sessionPerformance,
    String sessionPerformanceExplanation,
    int caseId,
  ) async {
    final entity = LocalSessionsCompanion(
      idNumber: Value(idNumber),
      professionalID: Value(professionalID),
      sessionDate: Value(sessionDate),
      sessionObjectives: Value(sessionObjectives),
      sessionSummary: Value(sessionSummary),
      therapeuticArchievements: Value(therapeuticArchievements),
      sessionNotes: Value(sessionNotes),
      sessionPerformance: Value(sessionPerformance),
      sessionPerformanceExplanation: Value(sessionPerformanceExplanation),
      caseId: Value(caseId),
    );
    await localDB.insertSession(entity);
  }

  @override
  addLocalProfessional({
    required String names,
    required String lastNames,
    required String userName,
    required int personalId,
    required int professionalId,
    required String email,
    required String adress,
    required String countryCode,
    required String securityQuestion,
    required String securityAnswer,
    required String securityPin,
    required String password,
  }) {
    final entity = LocalProfessionalCompanion(
      userName: Value(userName),
      names: Value(names),
      lastNames: Value(lastNames),
      personalID: Value(personalId),
      professionalID: Value(professionalId),
      adress: Value(adress),
      email: Value(email),
      countryCode: Value(countryCode),
      securityQuestion: Value(securityQuestion),
      securityAnswers: Value(securityAnswer),
      encodedRecoverPin: Value(securityPin),
      password: Value(password),
    );

    localDB.insertProfessional(entity);
  }

  @override
  Future<List<LocalPatient>> searchPatient(String user) {
    return localDB.userConsultation(user);
  }

  @override
  Future<List<LocalProfessionalData>> loginExistingProfessional(
    String userName,
  ) {
    return localDB.loginProfessional(userName);
  }

  @override
  Stream<List<LocalProfessionalData>> fetchInitialRegisterUsers() {
    return localDB.initalProfessionalFetch();
  }

  @override
  Future<Setting?> verifySettingsData() async {
    return await localDB.verifyExistingSettings();
  }

  @override
  void insertSettings(
      {required int id,
      required bool darkModeEnabled,
      required bool offlineEnabled,
      required bool isConfigured}) {
    final data = SettingsCompanion(
      id: Value(id),
      isConfigured: Value(isConfigured),
      isDarkModeEnabled: Value(darkModeEnabled),
      isOfflineModeEnabled: Value(offlineEnabled),
    );
    localDB.insertSettings(data);
  }

  @override
  void insertRemoteDatabaseCredentials(
      {required String databaseName,
      required String serverAdress,
      required int port,
      required String username,
      required String databasePassword}) {
    final data = ServerDatabaseCompanion(
      databaseName: Value(databaseName),
      server: Value(serverAdress),
      userName: Value(username),
      port: Value(port),
      password: Value(password),
    );
    localDB.insertDatabaseAccess(data);
  }

  @override
  void updateConfigurationState(bool isConfigured) {
    localDB.updateConfigurationState(isConfigured);
  }

  @override
  Stream<Setting> getSettingsAsStream() {
    return localDB.watchCurrentSettings();
  }

  @override
  Future<Setting> getLocalSettings() {
    return localDB.getLocalSettings();
  }

  @override
  Future updateThemeMode(bool isDarkEnabled) {
    return localDB.updateThemeMode(isDarkEnabled);
  }

  @override
  Future<List<ServerDatabaseData>> getServerConfigurationList() {
    return localDB.getServerConfigurations();
  }

  @override
  Future<List<LocalProfessionalData>> getProfessionalsList() {
    return localDB.getProfessionalsList();
  }

  @override
  Future updateConnectionMode(bool isOfflineEnabled) {
    return localDB.updateConnectionMode(isOfflineEnabled);
  }

  @override
  Future<void> addLocalTodo({
    required DateTime date,
    required String todoTitle,
    required String? todoDescription,
    required List<String> categoryList,
    required Color itemColor,
    required bool isComplete,
  }) {
    final data = LocalTodosCompanion(
      todo: Value(todoTitle),
      description: Value(todoDescription),
      creationDate: Value(date),
      category: Value(
        categoryList.isEmpty ? null : categoryList.join(','),
      ),
      itemColor: Value(
        itemColor.value,
      ),
      isComplete: Value(isComplete),
    );
    return localDB.insertTodo(data);
  }

  @override
  Future<List<LocalAppointment>> getLocalAppointments() {
    return localDB.getLocalAppointments();
  }

  @override
  Future<List<LocalPatient>> getLocalPatientsList() {
    return localDB.getPatientsList();
  }

  @override
  Future<void> addLocalAppointMent(
      {required DateTime date,
      required int professionalId,
      required int patientId,
      required String? description,
      required CalendarEventStates state,
      required CalendarEventType eventType}) async {
    String eventStatus = AppMethods().parseCalendarEventStateFromEnum(state);
    String type = AppMethods().parseCalendarEventTypeFromEnum(eventType);
    final data = LocalAppointmentsCompanion(
      date: Value(date),
      description: Value(description),
      patientID: Value(patientId),
      professionalID: Value(professionalId),
      sessionType: Value(type),
      status: Value(eventStatus),
    );

    await localDB.insertAppointment(data);
  }

  @override
  void deleteAppointments(int eventId) async {
    await localDB.deleteLocalEvent(eventId);
  }

  @override
  void deleteTodo(int todoId) async {
    await localDB.deleteLocalTodo(todoId);
  }

  @override
  Future<List<LocalTodo>> getLocalTodos() async {
    return await localDB.getLocalTodos();
  }

  @override
  Future updateTodoState(int todoId, bool newState) async {
    await localDB.updateTodoState(todoId, newState);
  }

  @override
  void insertLocalTreatmentPlan({
    required DateTime date,
    required String treatmentTitle,
    required String treatmentDescription,
    required int professionalID,
    required String treatmentData,
  }) async {
    final data = LocalTreatmentPlansCompanion(
      creationDate: Value(date),
      professionalID: Value(professionalID),
      treatmentTitle: Value(treatmentTitle),
      treatmentDescription: Value(treatmentDescription),
      treatmentData: Value(treatmentData),
    );

    await localDB.insertTreatmentPlan(data);
  }

  @override
  void insertLocalTreatmentPlanResult({
    required int sessionNumber,
    required DateTime applicationDate,
    required int treatmentPlanID,
    required int patientID,
    required int professionalID,
    required int patientCaseID,
    required int phaseNumber,
    required String treatmentResultData,
  }) async {
    final data = LocalTreatmentResultsCompanion(
      patientCaseId: Value(patientCaseID),
      applicationDate: Value(applicationDate),
      patientID: Value(patientID),
      professionalID: Value(professionalID),
      treatmentPlanID: Value(treatmentPlanID),
      sessionNumber: Value(sessionNumber),
      phaseNumber: Value(phaseNumber),
      treatmentResultsData: Value(treatmentResultData),
    );
    localDB.insertTreatmentPlanResult(data);
  }

  @override
  void deleteLocalTreatmentPlan(int treatmentId) {
    localDB.deleteLocalTreatmentPlan(treatmentId);
  }

  @override
  Future<List<LocalTreatmentPlan>> getLocalTreatmentPlans() async {
    return localDB.getLocalTreatmentPlans();
  }

  @override
  void updateLocalTreatmentPlan(TreatmentPlan newTreatmentPlanData) {
    localDB.updateTreatmentPlan(
      LocalTreatmentPlan(
          id: newTreatmentPlanData.id,
          creationDate: newTreatmentPlanData.creationDate,
          treatmentTitle: newTreatmentPlanData.title,
          treatmentDescription: newTreatmentPlanData.description,
          treatmentData: json.encode(newTreatmentPlanData.sectionsList
              .map((e) => e.toJson())
              .toList()),
          professionalID: newTreatmentPlanData.creatorId),
    );
  }

  @override
  void updateLocalPatientActiveState(int patientId, bool newState) {
    localDB.updatePatientActiveState(
      patientId,
      newState,
    );
  }

  @override
  void insertPatientCase(
    DateTime creationDate,
    int patientId,
    int professionalId,
    String consultationReason,
    String treatmentProposal,
    String diagnostic,
    String? icdDiagnosticCode,
    String? caseNotes,
    int? treatmentPlanId,
    int? treatmentPlanPhase,
  ) {
    final data = LocalPatientCaseCompanion(
      creationDate: Value(creationDate),
      patientId: Value(patientId),
      professionalId: Value(professionalId),
      consultationReason: Value(consultationReason),
      diagnostic: Value(diagnostic),
      icdDiagnosticCode: Value(icdDiagnosticCode),
      treatmentProposal: Value(treatmentProposal),
      caseNotes: Value(caseNotes),
      isActive: const Value(false),
      patientCaseClosed: const Value(false),
      treatmentPlanId: Value(treatmentPlanId),
      localTreatmentPlanPhase: Value(treatmentPlanPhase),
    );
    localDB.insertPatientCase(data);
  }

  @override
  Future<LocalPatient> getSinglePatient(int idNumber) async {
    return localDB.getSinglePatient(idNumber);
  }

  @override
  Future<List<LocalPatient>> getPatientsListById(int idNumber) {
    return localDB.getPatientsListById(idNumber);
  }

  @override
  void deleteLocalClinicHistory(int id) {
    localDB.deleteLocalClinicHisoty(id);
  }

  @override
  Future<List<LocalClinicHistoryData>> getClinicHistoryListById(int patientId) {
    return localDB.clinicHistoryConsultation(patientId);
  }

  @override
  Future<LocalClinicHistoryData> getSingleClinicHistoryById(int patientId) {
    return localDB.getSingleClinicHistory(patientId);
  }

  @override
  Future<LocalPatientCaseData?> getSinglePatientCase(int patientId) {
    return localDB.getSinglePatientCase(patientId);
  }

  @override
  Future<List<LocalPatientCaseData>> getPatientCasesList(int patientId) {
    return localDB.getPatientCases(patientId);
  }

  @override
  void disactivatePatientCases(int caseId) {
    localDB.disactivatePatientCases(caseId);
  }

  @override
  void activatePatientCase(int caseId) {
    localDB.activatePatientCases(caseId);
  }

  @override
  void deleteLocalPatientCase(int caseId) {
    localDB.deleteLocalPatientCase(caseId);
  }

  @override
  void updatePatientCaseCurrentPhase(int caseId, int newPhase) {
    localDB.updatePatientCasePhase(caseId, newPhase);
  }

  @override
  Future<List<LocalSession>> getPatientSessionsList(int patientId) {
    return localDB.getPatientSessionsList(patientId);
  }

  @override
  void insertIcdData(IcdDataParser data) async {
    final dataToSave = SavedIcdDiagnosticDataCompanion(
      title: Value(data.title),
      definition: Value(data.definition),
      icdRelease: Value(data.icdRelease),
      categoryData: Value(
        data.child.map((e) => e.toJson()).toList().toString(),
      ),
    );
    await localDB.insertIcdDiagnosticData(dataToSave);
  }

  @override
  Future<List<SavedIcdDiagnosticDataData>> getDiagnosticData() async {
    return await localDB.getIcdCategories();
  }

  @override
  void deleteSavedIcdData() {
    localDB.deleteSavedIcdData();
  }

  @override
  Future<List<LocalTreatmentResult>> getTreatmentPlanResults(int patientId) {
    return localDB.getTreatmentPlanResults(patientId);
  }

  @override
  void deleteLocalPatient(int patientId) {
    localDB.deleteLocalPatient(patientId);
  }

  @override
  void deleteLocalSession(int sessionId) {
    localDB.deleteLocalSession(sessionId);
  }

  @override
  void updateProfessionalPassword(int userId, String password) {
    localDB.updateLocalUserPassword(userId, password);
  }

  @override
  void updateProfessionalPasswordAndPin(
      int userId, String password, String pin) {
    localDB.updateLocalUserPasswordAndPin(userId, password, pin);
  }
}
