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
    required String professionalID,
  });
  List<Patient> queryPatients(List<Patient> patientsList, String query);

  void addPatientCase(
      WidgetRef ref,
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
      bool isOffline);

  void updateLocalPatientActiveState(
    WidgetRef ref,
    String patientId,
    bool newState,
    bool isOffline,
  );

  void updatePatientCaseCurrentPhase(
      WidgetRef ref, String caseId, int newPhase);

  Future<List<Patient>> getPatient(WidgetRef ref, int idNumber);

  Future<List<PatientCase>> getPatientCaseList(Ref ref, String patientId);

  ///Intended to be used as an alternative to [getPatientCaseList] from a [ConsumerWidget] instead of a [Provider].
  Future<List<PatientCase>> getPatientCaseListFromConsumer(
      WidgetRef ref, String patientId);
  Future<PatientCase?> getPatientActiveCase(WidgetRef ref, String patientId);
  void updatePatientCaseActiveState(
      WidgetRef ref, String patientId, String caseId, bool currentCaseState);

  void deletePatientCase(WidgetRef ref, String caseId);
  Future<List<Session>> getPatientSessionsList(WidgetRef ref, String patientId);
  Future<List<Session>> fetchPatientSessionsList(Ref ref, String patientId);

  Future<List<TreatmentPlanResult>> getTreatmentPlanResults(
      Ref ref, String patientId);

  ///Method for receiving patient related data sources and returning their json variants
  String encodePatientData(
      {required Patient patientData,
      required ClinicHistory clinicHistory,
      required List<Session> sessionData,
      required List<PatientCase> caseData});

  Future<void> importPatientData({
    required WidgetRef ref,
    required String decryptedPatientData,
    required String professionalId,
  });

  void deletePatientData(WidgetRef ref, String patientId);
  void closeCurrentPatientCase(
      WidgetRef ref, String caseId, String outcome, String? outcomeDescription);
}

final patientsRepositoryProvider = Provider<PatientsRepositoryInterface>(
  (ref) => PatientsRepository(),
);
