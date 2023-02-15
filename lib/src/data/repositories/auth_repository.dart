import 'dart:developer';

import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/auth_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/global_user_information_provider.dart';
import 'package:aronnax/src/data/providers/login_provider.dart';
import 'package:aronnax/src/domain/entities/remote_professional.dart';
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
          ref
              .read(globalUserNameProvider.notifier)
              .update((state) => element.names);
          ref
              .read(globalUserLastNameProvider.notifier)
              .update((state) => element.lastNames);
          ref
              .read(globalProfessionalIDProvider.notifier)
              .update((state) => element.professionalID.toString());
          ref
              .read(globalProfessionalPersonalIDProvider.notifier)
              .update((state) => element.personalID);
        }
      }
    }
    return ref.watch(remoteLoginStateProvider).isNotEmpty;
  }

  @override
  Future<bool> loginLocalUser({
    required WidgetRef ref,
    required int userID,
  }) async {
    List<ProfessionalData> professionalData = await ref
        .read(localDatabaseRepositoryProvider)
        .loginExistingProfessional(userID);
    log(professionalData.toString());
    if (professionalData.isNotEmpty) {
      ref.read(globalUserNameProvider.notifier).update(
          (state) => professionalData.map((e) => e.names).toList().single);
      ref.read(globalUserLastNameProvider.notifier).update(
          (state) => professionalData.map((e) => e.lastNames).toList().single);
      ref.read(globalProfessionalIDProvider.notifier).update(
            (state) => professionalData
                .map((e) => e.professionalID)
                .toList()
                .single
                .toString(),
          );
      ref.read(userPasswordProvider.notifier).update(
          (state) => professionalData.map((e) => e.password).toList().single);
    }
    return professionalData.isNotEmpty;
  }
}
