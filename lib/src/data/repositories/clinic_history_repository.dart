import 'package:aronnax/src/data/interfaces/clinic_history_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/domain/entities/clinic_history.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClinicHistoryRepository implements ClinicHistoryRepositoryInterface {
  @override
  void addClinicHistory(
      WidgetRef ref,
      String registerCode,
      DateTime dateTime,
      String mentalExamn,
      String medAntecedents,
      String psiAntecedents,
      String familyHistory,
      String personalHistory,
      int patientId,
      int professionalID) {
    if (ref.read(offlineStatusProvider).value!) {
      ref.read(localDatabaseRepositoryProvider).addLocalClinicHistory(
            registerCode,
            dateTime,
            mentalExamn,
            medAntecedents,
            psiAntecedents,
            familyHistory,
            personalHistory,
            patientId,
            professionalID,
          );
    }
  }

  @override
  void deleteClinicHistory(WidgetRef ref, int clinicHistoryId) {
    // TODO: implement deleteClinicHistory
  }

  @override
  Future<List<ClinicHistory>> getClinicHistoryListById(
      WidgetRef ref, int patientId) {
    // TODO: implement getClinicHistoryListById
    throw UnimplementedError();
  }

  @override
  Future<ClinicHistory> getPatientClinicHistory(WidgetRef ref, int patientId) {
    // TODO: implement getPatientClinicHistory
    throw UnimplementedError();
  }
}
