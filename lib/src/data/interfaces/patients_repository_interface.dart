import 'package:aronnax/src/data/repositories/patients_repository.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PatientsRepositoryInterface {
  Future<List<Patient>> getPatientsList(Ref ref, bool isOffline);
  Future<Patient?> addPatient({
    required WidgetRef ref,
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
  List<Patient> queryPatients(List<Patient> patientsList, String query);

  void addPatientCase(
      WidgetRef ref,
      DateTime creationDate,
      int patientId,
      int professionalId,
      String consultationReason,
      String treatmentProposal,
      String diagnostic,
      String? caseNotes,
      bool isOffline);

  void updateLocalPatientActiveState(
    WidgetRef ref,
    int patientId,
    bool newState,
    bool isOffline,
  );

  void addPatientTreatmentPlan(
    WidgetRef ref,
    int treatmentPlanId,
    int patientId,
    DateTime creationDate,
    bool isOffline,
  );

  Future<List<Patient>> getPatient(WidgetRef ref, int idNumber);
}

final patientsRepositoryProvider = Provider<PatientsRepositoryInterface>(
  (ref) => PatientsRepository(),
);
