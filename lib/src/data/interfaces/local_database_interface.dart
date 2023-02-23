import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/repositories/database_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class LocalDatabaseInteface {
  void addLocalPatient({
    required String names,
    required String lastNames,
    required DateTime birthDate,
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
    String consultationReason,
    String mentalExamn,
    String treatment,
    String medAntecedents,
    String psiAntecedents,
    String familyHistory,
    String personalHistory,
    String diagnostic,
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
  );

  void addLocalProfessional(int personalID, String names, String lastNames,
      int professionalID, String userName, String password);

  Future<List<LocalPatient>> searchPatient(String user);

  Future<List<LocalProfessionalData>> loginExistingProfessional(int userID);

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

  Future<void> addLocalTodo({
    required DateTime date,
    required String todoTitle,
    required String? todoDescription,
    required List<String> categoryList,
    required Color itemColor,
    required bool isComplete,
  });

  void updateConfigurationState(bool isConfigured);

  Future updateThemeMode(bool isDarkEnabled);

  Future updateConnectionMode(bool isOfflineEnabled);

  Future<List<ServerDatabaseData>> getServerConfigurationList();

  Future<List<LocalProfessionalData>> getProfessionalsList();

  Stream<Setting> getSettingsAsStream();

  Future<Setting> getLocalSettings();
  Future<List<LocalAppointment>> getLocalAppointments();
  Future<List<LocalPatient>> getLocalPatientsList();
}

final localDatabaseRepositoryProvider = Provider<LocalDatabaseInteface>(
  (ref) => DatabaseRepository(),
);
