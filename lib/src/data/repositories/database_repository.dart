import 'dart:ui';

import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/remote_database/server_api.dart';
import 'package:drift/drift.dart';

class DatabaseRepository implements LocalDatabaseInteface {
  LocalDatabase localDB = LocalDatabase();

  @override
  addLocalPatient({
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
  }) {
    final entity = PatientsCompanion(
        names: Value(names),
        lastNames: Value(lastNames),
        birthDate: Value(birthDate),
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
  ) async {
    final entity = ClinicHistoryCompanion(
      registerNumber: Value(registerCode),
      currentDate: Value(dateTime),
      consultationReason: Value(consultationReason),
      mentalExamination: Value(mentalExamn),
      medAntecedents: Value(medAntecedents),
      psiAntecedents: Value(psiAntecedents),
      familyHistory: Value(familyHistory),
      personalHistory: Value(personalHistory),
      diagnostic: Value(diagnostic),
      treatment: Value(treatment),
      idNumber: Value(idNumber),
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
  ) async {
    final entity = SessionsCompanion(
      idNumber: Value(idNumber),
      professionalID: Value(professionalID),
      sessionDate: Value(sessionDate),
      sessionObjectives: Value(sessionObjectives),
      sessionSummary: Value(sessionSummary),
      therapeuticArchievements: Value(therapeuticArchievements),
    );
    await localDB.insertSession(entity);
  }

  @override
  addLocalProfessional(int personalID, String names, String lastNames,
      int professionalID, String userName, String password) {
    final entity = ProfessionalCompanion(
      userName: Value(userName),
      names: Value(names),
      lastNames: Value(lastNames),
      personalID: Value(personalID),
      professionalID: Value(professionalID),
      password: Value(password),
    );

    localDB.insertProfessional(entity);
  }

  @override
  Future<List<Patient>> searchPatient(String user) {
    return localDB.userConsultation(user);
  }

  @override
  Future<List<ProfessionalData>> loginExistingProfessional(int userID) {
    return localDB.loginProfessional(userID);
  }

  @override
  Stream<List<ProfessionalData>> fetchInitialRegisterUsers() {
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
  Future<List<ProfessionalData>> getProfessionalsList() {
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
    final data = TodosCompanion(
      todo: Value(todoTitle),
      description: Value(todoDescription),
      creationDate: Value(date),
      category: Value(
        categoryList.join(','),
      ),
      itemColor: Value(
        itemColor.value,
      ),
      isComplete: Value(isComplete),
    );
    return localDB.insertTodo(data);
  }
}
