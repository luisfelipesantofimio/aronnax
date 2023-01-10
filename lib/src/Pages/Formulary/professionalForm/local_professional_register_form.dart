import 'package:aronnax/main.dart';
import 'package:aronnax/src/API/server_api.dart';
import 'package:aronnax/src/Pages/settings/ServerConfigForms/Welcome/Views/finish.dart';
import 'package:aronnax/src/database/local_model/local_queries.dart';
import 'package:aronnax/src/database/settings_model.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String _password = "";

final _hashedPassword = Crypt.sha256(_password);

class LocalProfessionalRegister extends StatefulWidget {
  const LocalProfessionalRegister({Key? key}) : super(key: key);

  @override
  _LocalProfessionalRegisterState createState() =>
      _LocalProfessionalRegisterState();
}

class _LocalProfessionalRegisterState extends State<LocalProfessionalRegister> {
  final professionalKey = GlobalKey<FormState>();
  int personalID = 0;
  String names = "";
  String lastNames = "";
  String profession = "Seleccionar profesión";
  int professionalID = 0;
  String userName = "";
  List<String> professionList = [
    "Seleccionar profesión",
    "Psicólogo",
    "Psicóloga",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      children: [
        Form(
          key: professionalKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "C.C del profesional",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (varID) {
                    setState(() {
                      personalID = int.parse(varID);
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Nombres",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (varNames) {
                    setState(() {
                      names = varNames;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Apellidos",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (varLastNames) {
                    setState(() {
                      lastNames = varLastNames;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: DropdownButtonFormField<String>(
                  onChanged: (value) {
                    setState(() {
                      profession = value!;
                    });
                  },
                  items: professionList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  value: profession,
                  validator: (value) {
                    if (value == "Seleccionar profesión") {
                      return "Selecciona una opción válida";
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Tarjeta profesional",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (varProfessionalID) {
                    setState(() {
                      professionalID = int.parse(varProfessionalID);
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Nombre de usuario",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (userVar) {
                    setState(() {
                      userName = userVar;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Tu contraseña",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (varPassword) {
                    setState(() {
                      _password = varPassword;
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  if (professionalKey.currentState!.validate()) {
                    professionalKey.currentState!.save();
                    localdb.put(
                      "serverSettings",
                      ServerSettings("", "", "", "", "", true),
                    );
                    addLocalProfessional(
                      personalID,
                      names,
                      lastNames,
                      professionalID,
                      userName,
                      _hashedPassword.toString(),
                    );
                    offlineModeDB.put(
                      "offlineModeDB",
                      LocalDatabaseMode(true),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("¡Hola! $names"),
                      ),
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FinishConfig(),
                        ));
                  }
                },
                child: const Text("Guardar"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
