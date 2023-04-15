import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final patientCaseListProvider =
    FutureProvider.family.autoDispose<List<PatientCase>, int>(
  (ref, patientId) =>
      ref.read(patientsRepositoryProvider).getPatientCaseList(ref, patientId),
);
