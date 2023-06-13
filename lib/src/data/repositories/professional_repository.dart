
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/professional_repository_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfessionalRepository implements ProfessionalRepositoryInterface {
  @override
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
  }) {
    final hashedPassword = Crypt.sha256(password);
    final hashedSecurityAnswer = Crypt.sha256(securityAnswer);
    final hashSecurityPin = Crypt.sha256(securityPin.toString());

    //  bool isOffline = ref.read(offlineStatusProvider).value!;
    //   if (isOffline) {
    ref.read(localDatabaseRepositoryProvider).addLocalProfessional(
          names: names,
          lastNames: lastNames,
          userName: userName,
          personalId: personalId,
          professionalId: professionalId,
          adress: adress,
          email: email,
          countryCode: countryCode,
          password: hashedPassword.toString(),
          securityQuestion: securityQuestion,
          securityPin: hashSecurityPin.toString(),
          securityAnswer: hashedSecurityAnswer.toString(),
        );

    //Sets the app as configured so you will be take to the login screen
    ref.read(localDatabaseRepositoryProvider).updateConfigurationState(true);

    //Configure the app to use the local database
    ref.read(localDatabaseRepositoryProvider).updateConnectionMode(true);
    //  }
  }

  @override
  void updateProfessionalPassword(
      WidgetRef ref, int professionalId, String newPassword) {
    final hashedPassword = Crypt.sha256(newPassword.toString());
    if (ref.read(offlineStatusProvider).value!) {
      ref.read(localDatabaseRepositoryProvider).updateProfessionalPassword(
            professionalId,
            hashedPassword.toString(),
          );
    }
  }

  @override
  void updateProfessionalPasswordAndSecretPin(
      WidgetRef ref, int professionalId, String newPassword, String pin) {
    final hashedPassword = Crypt.sha256(newPassword.toString());
    final hashedPin = Crypt.sha256(
      pin,
    );

    if (ref.read(offlineStatusProvider).value!) {
      ref
          .read(localDatabaseRepositoryProvider)
          .updateProfessionalPasswordAndPin(
            professionalId,
            hashedPassword.toString(),
            hashedPin.toString(),
          );
    }
  }
}

//TODO: finish registration system