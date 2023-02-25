import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final patientsListProvider =
    FutureProvider.autoDispose<List<Patient>>((ref) async {
  if (ref.read(offlineStatusProvider).value!) {
    final localPatientsList =
        await ref.read(localDatabaseRepositoryProvider).getLocalPatientsList();
    return localPatientsList.map((e) => Patient.fromLocalModel(e)).toList();
  } else {
    //TODO: Implement remote query
    return [];
  }
});
