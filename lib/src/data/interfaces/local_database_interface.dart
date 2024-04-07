import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/repositories/database_repository.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:aronnax/src/domain/entities/patient_companion.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class LocalDatabaseInteface {
  void addLocalPatient({
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
    required String professionalID,
    String? companionId,
  });

  Future<LocalPatientCompanionData> addLocalPatientCompanion(
      PatientCompanionModel patientCompanion);

  Future<void> addLocalClinicHistory(
    String registerCode,
    DateTime dateTime,
    String mentalExamn,
    String medAntecedents,
    String psiAntecedents,
    String familyHistory,
    String personalHistory,
    String idNumber,
    String professionalID,
  );

  Future<void> addLocalSession(
    String sessionSummary,
    String sessionObjectives,
    String therapeuticArchievements,
    String idNumber,
    String professionalID,
    DateTime sessionDate,
    String sessionNotes,
    int sessionPerformance,
    String sessionPerformanceExplanation,
    String caseId,
  );

  void addLocalProfessional({
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
  });

  Future<List<LocalPatient>> searchPatient(String user);

  Future<List<LocalProfessionalData>> loginExistingProfessional(
    String userName,
  );

  Stream<List<LocalProfessionalData>> fetchInitialRegisterUsers();

  Future<Setting?> verifySettingsData();

  void insertSettings(
      {required int id,
      required bool darkModeEnabled,
      required bool offlineEnabled,
      required bool isConfigured});

  void insertRemoteDatabaseCredentials({
    required String databaseName,
    required String serverAdress,
    required int port,
    required String username,
    required String databasePassword,
  });

  void insertLocalTreatmentPlan({
    String? id,
    required DateTime date,
    required String treatmentTitle,
    required String treatmentDescription,
    required String professionalID,
    required String treatmentData,
  });

  void insertLocalTreatmentPlanResult({
    required int sessionNumber,
    required DateTime applicationDate,
    required String treatmentPlanID,
    required String patientID,
    required String professionalID,
    required String patientCaseID,
    required int phaseNumber,
    required String treatmentResultData,
  });

  Future<void> addLocalTodo({
    required DateTime date,
    required String todoTitle,
    required String? todoDescription,
    required List<String> categoryList,
    required Color itemColor,
    required bool isComplete,
  });

  Future<void> addLocalAppointMent(
      {required DateTime date,
      required String professionalId,
      required String patientId,
      required String? description,
      required CalendarEventStates state,
      required CalendarEventType eventType});

  Future<void> addMultiLocalAppointMent({
    required DateTime date,
    required String professionalId,
    required String patientId,
    required String? description,
    required CalendarEventStates state,
    required CalendarEventType eventType,
    required int numberOfRepetitions,
  });

  Future<int> deleteAppointmentsGroup({required String groupId});

  Future<void> updateLocalAppointment({required CalendarEvent eventData});

  void updateConfigurationState(bool isConfigured);

  Future updateThemeMode(bool isDarkEnabled);

  Future updateConnectionMode(bool isOfflineEnabled);

  Future updateTodoState(String todoId, bool newState);

  Future<List<ServerDatabaseData>> getServerConfigurationList();

  Future<List<LocalProfessionalData>> getProfessionalsList();

  Stream<Setting> getSettingsAsStream();

  Future<Setting> getLocalSettings();
  Future<List<LocalAppointment>> getLocalAppointments();
  Future<List<LocalPatient>> getLocalPatientsList();
  Future<List<LocalTodo>> getLocalTodos();

  void deleteAppointments(String eventId);

  void deleteTodo(String todoId);

  Future<List<LocalTreatmentPlan>> getLocalTreatmentPlans();
  void deleteLocalTreatmentPlan(String treatmentId);
  void updateLocalTreatmentPlan(TreatmentPlan newTreatmentPlanData);
  void updateLocalPatientActiveState(String patientId, bool newState);

  Future<List<LocalPatientCaseData>> getPatientCasesList(String patientId);
  Future<LocalPatientCaseData?> getSinglePatientCase(String patientId);

  void insertPatientCase(
    DateTime creationDate,
    String patientId,
    String professionalId,
    String consultationReason,
    String treatmentProposal,
    String diagnostic,
    String? icdDiagnosticCode,
    String? caseNotes,
    String? treatmentPlanId,
    int? treatmentPlanPhase,
  );

  Future<LocalPatient> getSinglePatient(int idNumber);
  Future<List<LocalPatient>> getPatientsListById(int idNumber);
  void deleteLocalClinicHistory(String id);

  Future<List<LocalClinicHistoryData>> getClinicHistoryListById(
      String patientId);
  Future<LocalClinicHistoryData> getSingleClinicHistoryById(String patientId);
  void disactivatePatientCases(String caseId);
  void activatePatientCase(String caseId);
  void deleteLocalPatientCase(String caseId);

  void updatePatientCaseCurrentPhase(String caseId, int newPhase);

  Future<List<LocalSession>> getPatientSessionsList(String patientId);

  void insertIcdData(IcdDataParser data);
  Future<List<SavedIcdDiagnosticDataData>> getDiagnosticData();
  void deleteSavedIcdData();
  void deleteLocalPatient(String patientId);
  void deleteLocalSession(String sessionId);

  Future<List<LocalTreatmentResult>> getTreatmentPlanResults(String patientId);

  void updateProfessionalPassword(String userId, String password);
  void updateProfessionalPasswordAndPin(
      String userId, String password, String pin);

  void closeLocalCurrentPatientCase(
      String caseId, String outcome, String? outcomeDescription);

  Future<LocalPatientCompanionData> getLocalPatientCompanion(
      String companionId);
}

final localDatabaseRepositoryProvider = Provider<LocalDatabaseInteface>(
  (ref) => DatabaseRepository(),
);
