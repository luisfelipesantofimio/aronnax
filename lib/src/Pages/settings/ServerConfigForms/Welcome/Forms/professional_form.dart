import 'package:aronnax/src/data/remote_database/server_api.dart';
import 'package:aronnax/src/Pages/settings/ServerConfigForms/Welcome/Views/finish.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';

String _password = "";

final _hashedPassword = Crypt.sha256(_password);

class ProfessionalForm extends StatefulWidget {
  const ProfessionalForm({Key? key}) : super(key: key);

  @override
  _ProfessionalFormState createState() => _ProfessionalFormState();
}

class _ProfessionalFormState extends State<ProfessionalForm> {
  final professionalKey = GlobalKey<FormState>();
  String personalID = "";
  String names = "";
  String lastNames = "";
  String profession = "";
  String professionalID = "";
  String userName = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      children: [
        Form(
          key: professionalKey,
          child: Card(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(2),
                      labelText: "C.C del profesional",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (varID) {
                      setState(() {
                        personalID = varID;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(2),
                      labelText: "Nombres",
                      labelStyle: TextStyle(color: Colors.black),
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
                    autofocus: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(2),
                      labelText: "Apellidos",
                      labelStyle: TextStyle(color: Colors.black),
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
                  child: TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(2),
                      labelText: "Profesión",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (varProfession) {
                      setState(() {
                        profession = varProfession;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(2),
                      labelText: "Tarjeta profesional",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (varProfessionalID) {
                      setState(() {
                        professionalID = varProfessionalID;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(2),
                      labelText: "Nombre de usuario Crearte Consciencia",
                      labelStyle: TextStyle(color: Colors.black),
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
                    obscureText: true,
                    autofocus: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(2),
                      labelText: "Tu contraseña",
                      labelStyle: TextStyle(color: Colors.black),
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
                      //String encryptedPassword = encryptPassword(_password, _password);
                      insertProfessional(
                        personalID,
                        names,
                        lastNames,
                        profession,
                        professionalID,
                        userName,
                        _hashedPassword.toString(),
                      );
                      if (professionalKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("¡Hola! $names"),
                          ),
                        );
                      } else {
                        null;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FinishConfig(),
                        ),
                      );

                      if (professionalKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("¡Hola! $names"),
                          ),
                        );
                      } else {
                        null;
                      }
                    }
                  },
                  child: const Text("Guardar"),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
