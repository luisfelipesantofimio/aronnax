import 'package:aronnax/src/data/repositories/auth_repository.dart';
import 'package:aronnax/src/domain/entities/remote_model/remote_professional.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepositoryInterface {
  bool validatePassword(String obtainedPassword, String userPassword);

  bool loginRemoteUser({
    required WidgetRef ref,
    required List<RemoteProfessional> professionalData,
    required int personalID,
  });

  Future<bool> loginLocalUser({required WidgetRef ref, required int userID});
}

final authenticationProvider = Provider<AuthRepositoryInterface>(
  (ref) => AuthRepository(),
);
