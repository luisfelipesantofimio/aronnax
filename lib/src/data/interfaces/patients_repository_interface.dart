import 'package:aronnax/src/data/repositories/patients_repository.dart';
import 'package:aronnax/src/domain/entities/clinic_history.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/domain/entities/session.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result.dart';
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
      String? icdDiagnosticCode,
      String? caseNotes,
      int? treatmentPlanId,
      int? treatmentPlanPhase,
      bool isOffline);

  void updateLocalPatientActiveState(
    WidgetRef ref,
    int patientId,
    bool newState,
    bool isOffline,
  );

  void updatePatientCaseCurrentPhase(WidgetRef ref, int caseId, int newPhase);

  Future<List<Patient>> getPatient(WidgetRef ref, int idNumber);

  Future<List<PatientCase>> getPatientCaseList(Ref ref, int patientId);

  ///Intended to be used as an alternative to [getPatientCaseList] from a [ConsumerWidget] instead of a [Provider].
  Future<List<PatientCase>> getPatientCaseListFromConsumer(
      WidgetRef ref, int patientId);
  Future<PatientCase?> getPatientActiveCase(WidgetRef ref, int patientId);
  void updatePatientCaseActiveState(
      WidgetRef ref, int patientId, int caseId, bool currentCaseState);

  void deletePatientCase(WidgetRef ref, int caseId);
  Future<List<Session>> getPatientSessionsList(WidgetRef ref, int patientId);
  Future<List<Session>> fetchPatientSessionsList(Ref ref, int patientId);

  Future<List<TreatmentPlanResult>> getTreatmentPlanResults(
      Ref ref, int patientId);

  ///Method for receiving patient related data sources and returning their json variants
  String encodePatientData(
      {required Patient patientData,
      required ClinicHistory clinicHistory,
      required List<Session> sessionData,
      required List<PatientCase> caseData});

  Future<void> importPatientData({
    required WidgetRef ref,
    required String decryptedPatientData,
    required int professionalId,
  });

  void deletePatientData(WidgetRef ref, int patientId);
  void closeCurrentPatientCase(WidgetRef ref, int caseId);
}

final patientsRepositoryProvider = Provider<PatientsRepositoryInterface>(
  (ref) => PatientsRepository(),
);
