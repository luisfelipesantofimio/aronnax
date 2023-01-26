import 'dart:developer';

import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/auth_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/global_user_information_provider.dart';
import 'package:aronnax/src/domain/entities/remote_professional.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/login_provider.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/main_menu/main_menu.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _loginKey = GlobalKey<FormState>();

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<LoginForm> {
  bool isPasswordVisible = false;

  bool userExists = false;

  String currentPasswordInServer = "";
  int currentPersonalID = 0;

  passwordVisivility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  void didChangeDependencies() {
    Future(
      () async {
        Setting isOffline =
            await ref.watch(localDatabaseRepositoryProvider).getLocalSettings();
        if (!isOffline.isOfflineModeEnabled) {
          ref
              .read(remoteLoginStateProvider.notifier)
              .getProfessionalsInServer();
        }
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = ref.read(authenticationProvider);
    final conectionMode = ref.watch(offlineStatusProvider);
    String userID = ref.watch(userIdProvider);
    log(userID);
    String userPassword = ref.watch(userPasswordProvider);

    return conectionMode.when(
      data: (offlineEnabled) {
        AsyncValue<List<ProfessionalData>> localLoginProvider = ref.watch(
          localLoginStateProvider(
            userID == ""
                ? 0
                : int.parse(
                    userID,
                  ),
          ),
        );

        List<RemoteProfessional> currentRemoteProfessionalData =
            offlineEnabled ? [] : ref.watch(remoteLoginStateProvider);

        return Form(
          key: _loginKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: Theme.of(context).textTheme.bodyMedium,
                  onFieldSubmitted: (value) {
                    _loginKey.currentState!.validate();
                  },
                  onChanged: (value) {
                    ref.read(userIdProvider.notifier).update(
                          (state) => value,
                        );
                    offlineEnabled
                        ? ref.watch(
                            localLoginStateProvider(
                              value == ""
                                  ? 0
                                  : int.parse(
                                      userID,
                                    ),
                            ),
                          )
                        : authProvider.setRemoteValues(
                            ref: ref,
                            personalID: int.parse(value),
                            professionalData: currentRemoteProfessionalData,
                          );

                    _loginKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta número de documento";
                    }
                    if (!userExists) {
                      return "El usuario no existe";
                    }
                    return null;
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    labelText: "Número de documento",
                    hintText: "Ingresa tu número de cédula registrado",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Color.fromARGB(255, 225, 225, 225),
                    ),
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    onChanged: (value) {
                      log("aa: $value, bb: $userPassword");

                      !offlineEnabled
                          ? authProvider.setRemoteValues(
                              personalID: int.parse(userID),
                              professionalData: currentRemoteProfessionalData,
                              ref: ref,
                            )
                          : "";

                      _loginKey.currentState!.validate();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ingresa tu contraseña";
                      }
                      if (!authProvider.loginUser(userPassword, value)) {
                        return "Contraseña incorrecta";
                      } else {
                        Future(
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainMenu(),
                            ),
                          ),
                        );
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      labelText: "Contraseña",
                      hintText:
                          "Contraseña para ${ref.watch(globalUserNameProvider)} ${ref.watch(globalUserLastNameProvider)}",
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      prefixIcon: const Icon(
                        Icons.vpn_key_outlined,
                        color: Color.fromARGB(255, 224, 224, 224),
                      ),
                      floatingLabelStyle:
                          Theme.of(context).textTheme.bodyMedium,
                    ),
                    obscureText: isPasswordVisible ? false : true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        passwordVisivility();
                      },
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                ),
                Visibility(
                  visible: offlineEnabled,
                  child: SizedBox(
                    height: 20,
                    child: localLoginProvider.when(
                      data: (data) {
                        if (data.isNotEmpty && offlineEnabled) {
                          Future(() {
                            ref.read(userPasswordProvider.notifier).update(
                                (state) => data
                                    .map((e) => e.password)
                                    .toList()
                                    .single);
                            authProvider.setLocaleValue(
                              ref: ref,
                              localProfessionalData: data,
                            );
                          });
                          setState(() {
                            userExists = data.isNotEmpty;
                          });

                          if (currentPasswordInServer != "") {
                            setState(() {
                              //userVerified = true;
                            });
                          } else {
                            setState(() {
                              //  userVerified = false;
                            });
                          }

                          _loginKey.currentState!.validate();
                        }

                        return const Visibility(
                            visible: false,
                            child: SizedBox(
                              height: 1,
                            ));
                      },
                      error: (error, stackTrace) => const Center(
                        child: Text("Algo salió mal :("),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text("Algo salió mal"),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
