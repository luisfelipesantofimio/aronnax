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
}
