import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final patientsListProvider =
    FutureProvider.autoDispose<List<Patient>>((ref) async {
  return ref.read(patientsRepositoryProvider).getPatientsList(
        ref,
        ref.read(offlineStatusProvider).value!,
      );
});
