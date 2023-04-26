import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final patientsListProvider =
    FutureProvider.autoDispose<List<Patient>>((ref) async {
  return ref.read(patientsRepositoryProvider).getPatientsList(
        ref,
        ref.read(offlineStatusProvider).value!,
      );
});

// Patient case provider
final caseFormConsultationReasonProvider =
    StateProvider<String?>((ref) => null);
final caseFormDiagnosticProvider = StateProvider<String?>((ref) => null);
final caseFormTreatmentProposalProvider = StateProvider<String?>((ref) => null);
final caseFormCaseNotesProvider = StateProvider<String?>((ref) => null);
final caseFormTreatmentPlanProvider =
    StateProvider<TreatmentPlan?>((ref) => null);
final caseFormDiagnosticCodeProvider = StateProvider<String?>((ref) => null);
