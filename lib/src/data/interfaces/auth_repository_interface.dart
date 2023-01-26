import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/repositories/auth_repository.dart';
import 'package:aronnax/src/domain/entities/remote_professional.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepositoryInterface {
  bool loginUser(String obtainedPassword, String userPassword);

  bool setRemoteValues({
    required WidgetRef ref,
    required List<RemoteProfessional> professionalData,
    required int personalID,
  });

  void setLocaleValue({
    required WidgetRef ref,
    required List<ProfessionalData> localProfessionalData,
  });
}

final authenticationProvider = Provider<AuthRepositoryInterface>(
  (ref) => AuthRepository(),
);
