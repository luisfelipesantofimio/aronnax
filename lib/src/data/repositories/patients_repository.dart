import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
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
      String? caseNotes,
      bool isOffline) {
    if (isOffline) {
      ref.read(localDatabaseRepositoryProvider).insertPatientCase(
          creationDate,
          patientId,
          professionalId,
          consultationReason,
          treatmentProposal,
          diagnostic,
          caseNotes);
    }
  }

  @override
  void addPatientTreatmentPlan(WidgetRef ref, int treatmentPlanId,
      int patientId, DateTime creationDate, bool isOffline) {
    if (isOffline) {
      ref.read(localDatabaseRepositoryProvider).insertPatientTreatmentPlan(
            treatmentPlanId,
            patientId,
            creationDate,
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
  Future<PatientCase> getPatientActiveCase(Ref ref, int patientId) async {
    //if (ref.read(offlineStatusProvider).value!) {
    LocalPatientCaseData localCase = await ref
        .read(localDatabaseRepositoryProvider)
        .getSinglePatientCase(patientId);
    return PatientCase.fromLocalModel(localCase);
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
}
