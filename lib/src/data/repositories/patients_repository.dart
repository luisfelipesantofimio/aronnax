import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
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
}
