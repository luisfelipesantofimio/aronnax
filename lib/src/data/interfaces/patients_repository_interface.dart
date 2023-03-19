import 'package:aronnax/src/data/repositories/patients_repository.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PatientsRepositoryInterface {
  Future<List<Patient>> getPatientsList(Ref ref, bool isOffline);
}

final patientsRepositoryProvider = Provider<PatientsRepositoryInterface>(
  (ref) => PatientsRepository(),
);
