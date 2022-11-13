import 'package:aronnax/main.dart';
import 'package:aronnax/src/providers/login_provider.dart';
import 'package:aronnax/src/database/local_model/local_model.dart';
import 'package:aronnax/src/database/settings_model.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:aronnax/src/Pages/MainMenu/main_menu.dart';
import 'package:aronnax/src/API/server_api.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var db = MySQL();
String userPassword = "";
String passwordInServer = "";
String userID = "";

String globalUserName = "";
String globalUserLastNames = "";
String globalProfessionalID = "";

final _loginKey = GlobalKey<FormState>();

LocalDatabaseMode currentLocalDBstatus = offlineModeDB.get("offlineModeDB");
bool isOfflineEnabled = currentLocalDBstatus.offlineModeEnabled;

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<LoginForm> {
  bool isPasswordVisible = false;
  bool wasPressed = false;

  bool userVerified = false;
  bool isAbleToLogin = false;

  passwordVisivility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
      wasPressed = !wasPressed;
    });
  }

  isPasswordValid(String serverPassword, String inputPassword) {
    log("Contraseña recibida: $serverPassword");
    bool result = Crypt(serverPassword).match(inputPassword);
    if (result == true) {
      setState(() {
        isAbleToLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<ProfessionalData>> loginProvider = ref.watch(
      localLoginStateProvider(
        userID == ""
            ? 0
            : int.parse(
                userID,
              ),
      ),
    );

    log("Base de datos local activada? $isOfflineEnabled");

    String currentUserName = "";
    String currentUserLastNames = "";
    String currentProfessionalID = "";
    String currentPasswordInServer = "";
    globalUserName = currentUserName;
    globalUserLastNames = currentUserLastNames;
    globalProfessionalID = currentProfessionalID;

    loginUser(inputID) {
      db.getConnection().then((conn) {
        String loginQuery =
            "select password from professional where personalID = $inputID";

        String namesQuery =
            "select names from professional where personalID = $inputID";
        String lastNamesQuery =
            "select lastNames from professional where personalID = $inputID";
        String professionalIdQuery =
            "select professionalID from professional where personalID = $inputID";

        conn.query(loginQuery).then((results) {
          for (var row in results) {
            setState(() {
              currentPasswordInServer = row[0];
              passwordInServer = currentPasswordInServer;
              log(currentPasswordInServer);
              if (currentPasswordInServer != "") {
                setState(() {
                  userVerified = true;
                });
              }
            });
          }
        });

        conn.query(namesQuery).then((results) {
          for (var row in results) {
            setState(() {
              globalUserName = row[0];
            });
          }
        });
        conn.query(lastNamesQuery).then((results) {
          for (var row in results) {
            setState(() {
              globalUserLastNames = row[0];
            });
          }
        });
        conn.query(professionalIdQuery).then((results) {
          for (var row in results) {
            setState(() {
              globalProfessionalID = row[0].toString();
            });
          }
        });
      });
    }

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
              style: Theme.of(context).textTheme.bodyText2,
              onFieldSubmitted: (value) {
                _loginKey.currentState!.validate();
              },
              onChanged: (value) {
                setState(() {
                  userID = value;
                });
                !isOfflineEnabled
                    ? loginUser(userID)
                    : ref.watch(
                        localLoginStateProvider(
                          userID == ""
                              ? 0
                              : int.parse(
                                  userID,
                                ),
                        ),
                      );

                setState(() {});
                _loginKey.currentState!.validate();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Inserta número de documento";
                }
                if (userVerified != true) {
                  return "El usuario no existe";
                }
              },
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                labelText: "Número de documento",
                hintText: "Ingresa tu número de cédula registrado",
                labelStyle: Theme.of(context).textTheme.bodyText2,
                hintStyle: Theme.of(context).textTheme.bodyText2,
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: Color.fromARGB(255, 225, 225, 225),
                ),
                floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                style: Theme.of(context).textTheme.bodyText2,
                onChanged: (value) {
                  setState(() {
                    userPassword = value;
                  });
                  isPasswordValid(passwordInServer, userPassword);
                  _loginKey.currentState!.validate();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Ingresa tu contraseña";
                  }
                  if (isAbleToLogin != true) {
                    return "Contraseña incorrecta";
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainMenu(),
                      ),
                    );
                    setState(() {
                      isAbleToLogin = false;
                    });
                  }
                },
                autofocus: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  labelText: "Contraseña",
                  hintText:
                      "Contraseña para $currentUserName $currentUserLastNames",
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  prefixIcon: const Icon(
                    Icons.vpn_key_outlined,
                    color: Color.fromARGB(255, 224, 224, 224),
                  ),
                  floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
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
                  icon: Icon(
                      wasPressed ? Icons.visibility : Icons.visibility_off),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            Visibility(
              visible: isOfflineEnabled,
              child: SizedBox(
                height: 20,
                child: loginProvider.when(
                  data: (data) {
                    if (data.isNotEmpty && isOfflineEnabled) {
                      setState(() {
                        currentPasswordInServer =
                            data.map((e) => e.password).toList().single;
                        currentUserName =
                            data.map((e) => e.names).toList().single;
                        currentUserLastNames =
                            data.map((e) => e.lastNames).toList().single;
                        currentProfessionalID = data
                            .map((e) => e.professionalID)
                            .toList()
                            .single
                            .toString();
                        globalUserName = currentUserName;
                        globalUserLastNames = currentUserLastNames;
                        globalProfessionalID = currentProfessionalID;
                        passwordInServer = currentPasswordInServer;
                      });
                      if (currentPasswordInServer != "") {
                        setState(() {
                          userVerified = true;
                        });
                      } else {
                        setState(() {
                          userVerified = false;
                        });
                      }
                      setState(() {});
                      _loginKey.currentState!.validate();
                    }

                    log(passwordInServer);
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
  }
}
