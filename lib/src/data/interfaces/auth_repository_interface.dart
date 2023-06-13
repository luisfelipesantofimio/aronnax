import 'package:aronnax/src/data/repositories/auth_repository.dart';
import 'package:aronnax/src/domain/entities/professional.dart';
import 'package:aronnax/src/domain/entities/remote_model/remote_professional.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepositoryInterface {
  bool validatePassword(String obtainedPassword, String userPassword);

  bool loginRemoteUser({
    required WidgetRef ref,
    required List<RemoteProfessional> professionalData,
    required int personalID,
  });

  Future<bool> loginLocalUser(
      {required WidgetRef ref, required String userName});

  bool verifyAccountOwner({
    required Professional professionalData,
    required String answerProvider,
  });

  bool validateAccountData({
    required int inputPersonalId,
    required String inputAdress,
    required String inputEmail,
    required Professional professionalData,
  });

  bool validateRecoverPin(
      {required String userInput, required String encodedPin});
}

final authenticationProvider = Provider<AuthRepositoryInterface>(
  (ref) => AuthRepository(),
);
