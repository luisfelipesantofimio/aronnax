import 'dart:developer';

import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/auth_repository_interface.dart';
import 'package:aronnax/src/data/providers/login_provider.dart';
import 'package:aronnax/src/domain/entities/remote_professional.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository implements AuthRepositoryInterface {
  @override
  bool loginUser(String obtainedPassword, String userPassword) {
    log("Contraseña Obtenida: $obtainedPassword. Input: $userPassword");
    return Crypt(obtainedPassword).match(userPassword);
  }

  @override
  bool setRemoteValues({
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
  void setLocaleValue({
    required WidgetRef ref,
    required List<ProfessionalData> localProfessionalData,
  }) {
    ref.read(globalUserNameProvider.notifier).update(
        (state) => localProfessionalData.map((e) => e.names).toList().single);
    ref.read(globalUserLastNameProvider.notifier).update((state) =>
        localProfessionalData.map((e) => e.lastNames).toList().single);
    ref.read(globalProfessionalIDProvider.notifier).update(
          (state) => localProfessionalData
              .map((e) => e.professionalID)
              .toList()
              .single
              .toString(),
        );
  }
}
