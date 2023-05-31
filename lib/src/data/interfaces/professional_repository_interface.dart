import 'package:aronnax/src/data/repositories/professional_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ProfessionalRepositoryInterface {
  void createProfessionalProfile({
    required WidgetRef ref,
    required String names,
    required String lastNames,
    required String userName,
    required int personalId,
    required int professionalId,
    required String adress,
    required String email,
    required String countryCode,
    required String password,
    required String securityQuestion,
    required String securityAnswer,
    required int securityPin,
  });
}

final professionalRepositoryProvider = Provider(
  (ref) => ProfessionalRepository(),
);
