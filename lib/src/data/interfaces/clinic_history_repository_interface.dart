import 'package:aronnax/src/data/repositories/clinic_history_repository.dart';
import 'package:aronnax/src/domain/entities/clinic_history.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ClinicHistoryRepositoryInterface {
  Future<List<ClinicHistory>> getClinicHistoryListById(
      Ref ref, String patientId);
  Future<ClinicHistory> getPatientClinicHistory(Ref ref, String patientId);

  ///Intended to be used as an alternative to [getPatientClinicHistory] from a [ConsumerWidget] instead of a [Provider].
  Future<ClinicHistory> getPatientClinicHistoryFromConsumer(
      WidgetRef ref, String patientId);
  void addClinicHistory(
    WidgetRef ref,
    String registerCode,
    DateTime dateTime,
    String mentalExamn,
    String medAntecedents,
    String psiAntecedents,
    String familyHistory,
    String personalHistory,
    String idNumber,
    String professionalID,
  );
  void deleteClinicHistory(WidgetRef ref, String clinicHistoryId);
}

final clinicHistoryRepositoryProvider = Provider(
  (ref) => ClinicHistoryRepository(),
);
