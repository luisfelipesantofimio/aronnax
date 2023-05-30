import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/auth_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/login_provider.dart';
import 'package:aronnax/src/domain/entities/professional.dart';
import 'package:aronnax/src/presentation/core/constants.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/main_menu/main_menu.dart';
import 'package:aronnax/src/presentation/password_recover/password_recover_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<LoginForm> {
  bool isPasswordVisible = false;
  bool userExists = false;

  @override
  void didChangeDependencies() {
    Future(
      () async {
        Setting settings =
            await ref.watch(localDatabaseRepositoryProvider).getLocalSettings();
        if (!settings.isOfflineModeEnabled) {
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
    final conectionMode = ref.watch(offlineStatusProvider);
    Professional? professionalData = ref.watch(globalUserInformationProvider);
    return conectionMode.when(
      data: (offlineEnabled) {
        return Form(
          key: loginKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: Theme.of(context).textTheme.bodyMedium,
                  onFieldSubmitted: (value) {
                    loginKey.currentState!.validate();
                  },
                  onChanged: (value) async {
                    if (offlineEnabled) {
                      userExists =
                          await ref.read(authenticationProvider).loginLocalUser(
                                ref: ref,
                                userName: value,
                              );
                    } else {
                      //TODO: implement remote login
                    }

                    loginKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta tu nombre de usuario";
                    }
                    if (!userExists) {
                      return "El usuario no existe";
                    }
                    return null;
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    labelText: "Nombre de usuario",
                    hintText: "Ingresa tu nombre de usuario registrado",
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
                      loginKey.currentState!.validate();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ingresa tu contraseña";
                      }
                      if (professionalData != null &&
                          !ref.read(authenticationProvider).validatePassword(
                              professionalData.password, value)) {
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
                          "Contraseña para ${professionalData != null ? professionalData.names : ''} ${professionalData != null ? professionalData.lastNames : ''}",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) => PasswordRecoverDialog(),
                        );
                      },
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
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
