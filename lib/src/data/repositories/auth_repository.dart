import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/auth_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/global_user_information_provider.dart';
import 'package:aronnax/src/data/providers/login_provider.dart';
import 'package:aronnax/src/domain/entities/professional.dart';
import 'package:aronnax/src/domain/entities/remote_model/remote_professional.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository implements AuthRepositoryInterface {
  @override
  bool validatePassword(String obtainedPassword, String userPassword) {
    return Crypt(obtainedPassword).match(userPassword);
  }

  @override
  bool loginRemoteUser({
    required WidgetRef ref,
    required List<RemoteProfessional> professionalData,
    required int personalID,
  }) {
    if (ref.watch(remoteLoginStateProvider).isNotEmpty) {
      for (var element in professionalData) {
        if (element.personalID == personalID) {
          ref.read(globalUserInformationProvider.notifier).update(
                (state) => Professional.fromRemoteModel(element),
              );
        }
      }
    }
    return ref.watch(remoteLoginStateProvider).isNotEmpty;
  }

  @override
  Future<bool> loginLocalUser({
    required WidgetRef ref,
    required String userName,
  }) async {
    List<LocalProfessionalData> professionalData = await ref
        .read(localDatabaseRepositoryProvider)
        .loginExistingProfessional(userName);
    if (professionalData.isNotEmpty) {
      ref.read(globalUserInformationProvider.notifier).update(
            (state) => Professional.fromLocalModel(
                professionalData.map((e) => e).toList().first),
          );

      ref.read(userPasswordProvider.notifier).update(
          (state) => professionalData.map((e) => e.password).toList().single);
    }
    return professionalData.isNotEmpty;
  }

  @override
  bool verifyAccountOwner({
    required Professional professionalData,
    required String answerProvider,
  }) {
    return Crypt(professionalData.encodedSecurityAnswer)
        .match(answerProvider.toLowerCase());
  }

  @override
  bool validateRecoverPin(
      {required String userInput, required String encodedPin}) {
    return Crypt(encodedPin).match(userInput);
  }

  @override
  bool validateAccountData({
    required int inputPersonalId,
    required String inputAdress,
    required String inputEmail,
    required Professional professionalData,
  }) {
    return professionalData.personalID == inputPersonalId &&
        professionalData.adress == inputAdress &&
        professionalData.email == inputEmail;
  }
}
