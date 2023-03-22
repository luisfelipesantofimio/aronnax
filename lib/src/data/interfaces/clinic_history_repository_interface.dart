import 'package:aronnax/src/data/repositories/clinic_history_repository.dart';
import 'package:aronnax/src/domain/entities/clinic_history.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ClinicHistoryRepositoryInterface {
  Future<List<ClinicHistory>> getClinicHistoryListById(Ref ref, int patientId);
  Future<ClinicHistory> getPatientClinicHistory(Ref ref, int patientId);
  void addClinicHistory(
    WidgetRef ref,
    String registerCode,
    DateTime dateTime,
    String mentalExamn,
    String medAntecedents,
    String psiAntecedents,
    String familyHistory,
    String personalHistory,
    int idNumber,
    int professionalID,
  );
  void deleteClinicHistory(WidgetRef ref, int clinicHistoryId);
}

final clinicHistoryRepositoryProvider = Provider(
  (ref) => ClinicHistoryRepository(),
);
