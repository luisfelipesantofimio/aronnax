import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/database/local_model/tables.dart';
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
    if (ref.read(offlineStatusProvider).value!) {
      ref
          .read(localDatabaseRepositoryProvider)
          .deleteLocalClinicHistory(clinicHistoryId);
    }
  }

  @override
  Future<List<ClinicHistory>> getClinicHistoryListById(
      WidgetRef ref, int patientId) async {
    if (ref.read(offlineStatusProvider).value!) {
      List<LocalClinicHistoryData> localClinicHistories = await ref
          .read(localDatabaseRepositoryProvider)
          .getClinicHistoryListById(patientId);
      return localClinicHistories
          .map((e) => ClinicHistory.fromLocalModel(e))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<ClinicHistory> getPatientClinicHistory(
      WidgetRef ref, int patientId) async {
    return ClinicHistory.fromLocalModel(
      await ref
          .read(localDatabaseRepositoryProvider)
          .getSingleClinicHistoryById(patientId),
    );
  }
}
