import 'package:aronnax/src/data/remote_database/server_api.dart';
import 'package:aronnax/src/presentation/core/constants.dart';
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
  String personalID = "";
  String names = "";
  String lastNames = "";
  String profession = "";
  String professionalID = "";
  String userName = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          //  key: professionalKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                    return null;
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "C.C del profesional",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
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
                  style: Theme.of(context).textTheme.bodyMedium,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                    return null;
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Nombres",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
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
                  style: Theme.of(context).textTheme.bodyMedium,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                    return null;
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Apellidos",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
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
                  style: Theme.of(context).textTheme.bodyMedium,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                    return null;
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Profesión",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
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
                  style: Theme.of(context).textTheme.bodyMedium,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                    return null;
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Tarjeta profesional",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
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
                  style: Theme.of(context).textTheme.bodyMedium,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                    return null;
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Nombre de usuario",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
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
                  style: Theme.of(context).textTheme.bodyMedium,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El campo no puede estar vacío";
                    }
                    return null;
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Tu contraseña",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
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

                      insertProfessional(
                          personalID,
                          names,
                          lastNames,
                          profession,
                          professionalID,
                          userName,
                          _hashedPassword.toString());
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
                  child: const Text("Guardar"))
            ],
          ),
        ),
      ],
    );
  }
}
