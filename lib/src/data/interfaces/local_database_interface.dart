import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/repositories/database_repository.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
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
    required int professionalID,
  });

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
  );

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
    required DateTime date,
    required String treatmentTitle,
    required String treatmentDescription,
    required int professionalID,
    required String treatmentData,
  });

  void insertLocalTreatmentPlanResult({
    required int sessionNumber,
    required DateTime applicationDate,
    required int treatmentPlanID,
    required int patientID,
    required int professionalID,
    required int patientCaseID,
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

  Future<void> addLocalAppointMent({
    required DateTime date,
    required int professionalId,
    required int patientId,
    required String? description,
    required CalendarEventStates state,
    required CalendarEventType eventType,
  });

  void updateConfigurationState(bool isConfigured);

  Future updateThemeMode(bool isDarkEnabled);

  Future updateConnectionMode(bool isOfflineEnabled);

  Future updateTodoState(int todoId, bool newState);

  Future<List<ServerDatabaseData>> getServerConfigurationList();

  Future<List<LocalProfessionalData>> getProfessionalsList();

  Stream<Setting> getSettingsAsStream();

  Future<Setting> getLocalSettings();
  Future<List<LocalAppointment>> getLocalAppointments();
  Future<List<LocalPatient>> getLocalPatientsList();
  Future<List<LocalTodo>> getLocalTodos();

  void deleteAppointments(int eventId);

  void deleteTodo(int todoId);

  Future<List<LocalTreatmentPlan>> getLocalTreatmentPlans();
  void deleteLocalTreatmentPlan(int treatmentId);
  void updateLocalTreatmentPlan(TreatmentPlan newTreatmentPlanData);
  void updateLocalPatientActiveState(int patientId, bool newState);

  Future<List<LocalPatientCaseData>> getPatientCasesList(int patientId);
  Future<LocalPatientCaseData?> getSinglePatientCase(int patientId);

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
  );

  Future<LocalPatient> getSinglePatient(int idNumber);
  Future<List<LocalPatient>> getPatientsListById(int idNumber);
  void deleteLocalClinicHistory(int id);

  Future<List<LocalClinicHistoryData>> getClinicHistoryListById(int patientId);
  Future<LocalClinicHistoryData> getSingleClinicHistoryById(int patientId);
  void disactivatePatientCases(int caseId);
  void activatePatientCase(int caseId);
  void deleteLocalPatientCase(int caseId);

  void updatePatientCaseCurrentPhase(int caseId, int newPhase);

  Future<List<LocalSession>> getPatientSessionsList(int patientId);

  void insertIcdData(IcdDataParser data);
  Future<List<SavedIcdDiagnosticDataData>> getDiagnosticData();
  void deleteSavedIcdData();
  void deleteLocalPatient(int patientId);
  void deleteLocalSession(int sessionId);

  Future<List<LocalTreatmentResult>> getTreatmentPlanResults(int patientId);
}

final localDatabaseRepositoryProvider = Provider<LocalDatabaseInteface>(
  (ref) => DatabaseRepository(),
);
