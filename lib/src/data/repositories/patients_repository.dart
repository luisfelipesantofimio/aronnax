import 'dart:developer';

import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/database/local_model/local_queries.dart';
import 'package:aronnax/src/data/interfaces/clinic_history_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/clinic_history.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/domain/entities/patient_global_data.dart';
import 'package:aronnax/src/domain/entities/session.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientsRepository implements PatientsRepositoryInterface {
  @override
  Future<List<Patient>> getPatientsList(Ref ref, bool isOffline) async {
    List<Patient> patientsList = [];
    if (isOffline) {
      List<LocalPatient> localPatientsList = await ref
          .read(localDatabaseRepositoryProvider)
          .getLocalPatientsList();

      for (var element in localPatientsList) {
        patientsList.add(
          Patient.fromLocalModel(element),
        );
      }
    }
    return patientsList;
  }

  @override
  void updateLocalPatientActiveState(
    WidgetRef ref,
    int patientId,
    bool newState,
    bool isOffline,
  ) {
    if (isOffline) {
      ref
          .read(localDatabaseRepositoryProvider)
          .updateLocalPatientActiveState(patientId, newState);
    }
  }

  @override
  List<Patient> queryPatients(List<Patient> patientsList, String query) {
    List<Patient> queriedPatientsList = [];
    queriedPatientsList.clear();

    if (query.isEmpty) {
      queriedPatientsList = patientsList;
    } else {
      for (var element in patientsList) {
        if (element.names.toLowerCase().contains(query) ||
            element.lastNames.toLowerCase().contains(query) ||
            element.idNumber.toString().toLowerCase().contains(query)) {
          queriedPatientsList.add(element);
        }
      }
    }
    return queriedPatientsList;
  }

  @override
  void addPatientCase(
      WidgetRef ref,
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
      bool isOffline) {
    if (isOffline) {
      ref.read(localDatabaseRepositoryProvider).insertPatientCase(
            creationDate,
            patientId,
            professionalId,
            consultationReason,
            treatmentProposal,
            diagnostic,
            icdDiagnosticCode,
            caseNotes,
            treatmentPlanId,
            treatmentPlanPhase,
          );
    }
  }

  @override
  Future<Patient?> addPatient(
      {required WidgetRef ref,
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
      required int professionalID}) async {
    if (ref.read(offlineStatusProvider).value!) {
      ref.read(localDatabaseRepositoryProvider).addLocalPatient(
          names: names,
          lastNames: lastNames,
          birthDate: birthDate,
          gender: gender,
          idNumber: idNumber,
          contactNumber: contactNumber,
          mail: mail,
          city: city,
          state: state,
          adress: adress,
          insurance: insurance,
          education: education,
          ocupation: ocupation,
          emergencyContactName: emergencyContactName,
          emergencyContactNumber: emergencyContactNumber,
          creationDate: creationDate,
          professionalID: professionalID);
      return Patient.fromLocalModel(
        await ref
            .read(localDatabaseRepositoryProvider)
            .getSinglePatient(idNumber),
      );
    } else {
      return null;
    }
  }

  @override
  Future<List<Patient>> getPatient(WidgetRef ref, int idNumber) async {
    if (ref.read(offlineStatusProvider).value!) {
      List<LocalPatient> patientsList = await ref
          .read(localDatabaseRepositoryProvider)
          .getPatientsListById(idNumber);
      return patientsList.map((e) => Patient.fromLocalModel(e)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<PatientCase?> getPatientActiveCase(
      WidgetRef ref, int patientId) async {
    //if (ref.read(offlineStatusProvider).value!) {
    LocalPatientCaseData? localCase = await ref
        .read(localDatabaseRepositoryProvider)
        .getSinglePatientCase(patientId);
    if (localCase == null) {
      return null;
    } else {
      return PatientCase.fromLocalModel(localCase);
    }
    // }else{
    //   return ?
    // }
  }

  @override
  Future<List<PatientCase>> getPatientCaseList(Ref ref, int patientId) async {
    if (ref.read(offlineStatusProvider).value!) {
      List<LocalPatientCaseData> localCasesList = await ref
          .read(localDatabaseRepositoryProvider)
          .getPatientCasesList(patientId);
      return localCasesList.map((e) => PatientCase.fromLocalModel(e)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<List<PatientCase>> getPatientCaseListFromConsumer(
      WidgetRef ref, int patientId) async {
    if (ref.read(offlineStatusProvider).value!) {
      List<LocalPatientCaseData> localCasesList = await ref
          .read(localDatabaseRepositoryProvider)
          .getPatientCasesList(patientId);
      return localCasesList.map((e) => PatientCase.fromLocalModel(e)).toList();
    } else {
      return [];
    }
  }

  @override
  void updatePatientCaseActiveState(
      WidgetRef ref, int patientId, int caseId, bool currentCaseState) async {
    if (ref.read(offlineStatusProvider).value!) {
      List<LocalPatientCaseData> localCasesList = await ref
          .read(localDatabaseRepositoryProvider)
          .getPatientCasesList(patientId);
      if (currentCaseState) {
        ref.read(localDatabaseRepositoryProvider).disactivatePatientCases(
              caseId,
            );
      } else {
        for (var element in localCasesList) {
          ref
              .read(localDatabaseRepositoryProvider)
              .disactivatePatientCases(element.id);
          ref.read(localDatabaseRepositoryProvider).activatePatientCase(caseId);
        }
      }
    }
  }

  @override
  void deletePatientCase(WidgetRef ref, int caseId) {
    if (ref.read(offlineStatusProvider).value!) {
      ref.read(localDatabaseRepositoryProvider).deleteLocalPatientCase(caseId);
    }
  }

  @override
  void updatePatientCaseCurrentPhase(WidgetRef ref, int caseId, int newPhase) {
    if (ref.read(offlineStatusProvider).value!) {
      ref
          .read(localDatabaseRepositoryProvider)
          .updatePatientCaseCurrentPhase(caseId, newPhase);
    }
  }

  @override
  Future<List<Session>> getPatientSessionsList(
      WidgetRef ref, int patientId) async {
    //  if (ref.read(offlineStatusProvider).value!) {
    List<LocalSession> sessionsList = await ref
        .read(localDatabaseRepositoryProvider)
        .getPatientSessionsList(patientId);
    return sessionsList.map((e) => Session.fromLocalModel(e)).toList();
    //   }
  }

  @override
  Future<List<Session>> fetchPatientSessionsList(Ref ref, int patientId) async {
    //  if (ref.read(offlineStatusProvider).value!) {
    List<LocalSession> sessionsList = await ref
        .read(localDatabaseRepositoryProvider)
        .getPatientSessionsList(patientId);
    return sessionsList.map((e) => Session.fromLocalModel(e)).toList();

    //   }
  }

  @override
  Future<List<TreatmentPlanResult>> getTreatmentPlanResults(
      Ref ref, int patientId) async {
    bool isOffline = ref.read(offlineStatusProvider).value!;
    // if (isOffline) {
    List<LocalTreatmentResult> localData = await ref
        .read(localDatabaseRepositoryProvider)
        .getTreatmentPlanResults(patientId);
    log(localData.toString());
    return localData.map((e) => TreatmentPlanResult.fromLocalModel(e)).toList();
    // }
  }

  @override
  String encodePatientData(
      {required Patient patientData,
      required ClinicHistory clinicHistory,
      required List<Session> sessionData,
      required List<PatientCase> caseData}) {
    return PatientGlobalData(
            patient: patientData,
            clinicHistory: clinicHistory,
            caseData: caseData,
            sessionData: sessionData)
        .toJson();
  }

  @override
  Future<void> importPatientData({
    required WidgetRef ref,
    required String decryptedPatientData,
    required int professionalId,
  }) async {
    List<Patient> patientsList = [];
    bool isOffline = ref.read(offlineStatusProvider).value!;
    PatientGlobalData patientData =
        PatientGlobalData.fromJson(decryptedPatientData);

    if (isOffline) {
      List localPatientsList = await ref
          .read(localDatabaseRepositoryProvider)
          .getLocalPatientsList();
      patientsList =
          localPatientsList.map((e) => Patient.fromLocalModel(e)).toList();
    }
    if (patientsList
        .any((element) => element.idNumber == patientData.patient.idNumber)) {
      throw Exception('The user is already registered!');
    }
    addPatient(
        ref: ref,
        names: patientData.patient.names,
        lastNames: patientData.patient.lastNames,
        birthDate: patientData.patient.birthDate,
        gender: patientData.patient.gender,
        idNumber: patientData.patient.idNumber,
        contactNumber: patientData.patient.contactNumber,
        mail: patientData.patient.mail,
        city: patientData.patient.city,
        state: patientData.patient.state,
        adress: patientData.patient.adress,
        insurance: patientData.patient.insurance,
        education: patientData.patient.education,
        ocupation: patientData.patient.ocupation,
        emergencyContactName: patientData.patient.emergencyContactName,
        emergencyContactNumber: patientData.patient.emergencyContactNumber,
        creationDate: patientData.patient.creationDate,
        professionalID: professionalId);
    ref.read(clinicHistoryRepositoryProvider).addClinicHistory(
          ref,
          patientData.clinicHistory.registerNumber,
          patientData.clinicHistory.creationDate,
          patientData.clinicHistory.mentalExamination,
          patientData.clinicHistory.medAntecedents,
          patientData.clinicHistory.psyAntecedents,
          patientData.clinicHistory.familyHistory,
          patientData.clinicHistory.personalHistory,
          patientData.clinicHistory.idNumber,
          patientData.clinicHistory.professionalId,
        );
    if (patientData.caseData.isNotEmpty) {
      for (var element in patientData.caseData) {
        addPatientCase(
            ref,
            element.creationDate,
            element.patientId,
            professionalId,
            element.consultationReason,
            element.treatmentProposal,
            element.diagnostic,
            element.icdDiagnosticCode,
            element.caseNotes,
            null,
            null,
            isOffline);
      }
    }
    if (patientData.sessionData.isNotEmpty) {
      for (var element in patientData.sessionData) {
        addLocalSession(
            sessionSummary: element.sessionSummary,
            sessionObjectives: element.sessionObjectives,
            therapeuticArchievements: element.therapeuticArchievements,
            idNumber: element.patientId,
            professionalID: element.professionalId,
            sessionDate: element.sessionDate,
            caseId: element.caseId,
            sessionNotes: element.sessionNotes,
            sessionPerformance: element.sessionPerformance,
            sessionPerformanceExplanation:
                element.sessionPerformanceExplanation);
      }
    }
    ref.invalidate(patientsListProvider);
  }

  @override
  void deletePatientData(WidgetRef ref, int patientId) async {
    //Offline logic only
    //bool isOffline = ref.read(offlineStatusProvider).value!;
    List localPatientCase = await ref
        .read(localDatabaseRepositoryProvider)
        .getPatientCasesList(patientId);
    List<PatientCase> patientCaseList =
        localPatientCase.map((e) => PatientCase.fromLocalModel(e)).toList();
    List localPatientSessionsList = await ref
        .read(localDatabaseRepositoryProvider)
        .getPatientSessionsList(patientId);
    List<Session> sessionsList =
        localPatientSessionsList.map((e) => Session.fromLocalModel(e)).toList();
    ref.read(localDatabaseRepositoryProvider).deleteLocalPatient(patientId);
    ref
        .read(localDatabaseRepositoryProvider)
        .deleteLocalClinicHistory(patientId);

    for (var element in patientCaseList) {
      ref
          .read(localDatabaseRepositoryProvider)
          .deleteLocalPatientCase(element.id);
    }

    for (var element in sessionsList) {
      ref.read(localDatabaseRepositoryProvider).deleteLocalSession(element.id);
    }

    ref.invalidate(patientsListProvider);
  }
}
