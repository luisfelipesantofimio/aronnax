import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/presentation/welcome_screens/finish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExistingServerForm extends ConsumerStatefulWidget {
  const ExistingServerForm({super.key});

  @override
  ExistingServerFormState createState() => ExistingServerFormState();
}

class ExistingServerFormState extends ConsumerState<ExistingServerForm> {
  final _formKey = GlobalKey<FormState>();
  String _serverAdress = "";
  String _serverPort = "";
  String _databaseName = "";
  String _databaseUser = "";
  String _databasePassword = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText:
                  "Tu dominio: mywebpage.com - La IP del servidor: 98.139.180.149 - Tu máquina: localhost",
              contentPadding: EdgeInsets.all(0),
              labelText: "Servidor",
              labelStyle:
                  TextStyle(color: Color.fromRGBO(65, 65, 67, 1), fontSize: 20),
              floatingLabelStyle: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(65, 65, 67, 1),
              ),
            ),
            onSaved: (valAdress) {
              setState(() {
                _serverAdress = valAdress!;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Inserta un valor";
              }
              return null;
            },
          ),
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Usualmente 3306",
              contentPadding: EdgeInsets.all(0),
              labelText: "Puerto",
              labelStyle:
                  TextStyle(color: Color.fromRGBO(65, 65, 67, 1), fontSize: 20),
              floatingLabelStyle: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(65, 65, 67, 1),
              ),
            ),
            onSaved: (valPort) {
              setState(() {
                _serverPort = valPort!;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Inserta un valor";
              }
              return null;
            },
          ),
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "my_database_name",
              contentPadding: EdgeInsets.all(0),
              labelText: "Nombre de la base de datos",
              labelStyle:
                  TextStyle(color: Color.fromRGBO(65, 65, 67, 1), fontSize: 20),
              floatingLabelStyle: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(65, 65, 67, 1),
              ),
            ),
            onSaved: (valDBname) {
              setState(() {
                _databaseName = valDBname!;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Inserta un valor";
              }
              return null;
            },
          ),
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "El nombre de usuario para acceder a la base de datos",
              contentPadding: EdgeInsets.all(0),
              labelText: "Nombre de usuario de la base de datos",
              labelStyle:
                  TextStyle(color: Color.fromRGBO(65, 65, 67, 1), fontSize: 20),
              floatingLabelStyle: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(65, 65, 67, 1),
              ),
            ),
            onSaved: (valUser) {
              setState(() {
                _databaseUser = valUser!;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Inserta un valor";
              }
              return null;
            },
          ),
          TextFormField(
              obscureText: true,
              autofocus: true,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                labelText: "Contraseña",
                labelStyle: TextStyle(
                    color: Color.fromRGBO(65, 65, 67, 1), fontSize: 20),
                floatingLabelStyle: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(65, 65, 67, 1),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Inserta un valor";
                }
                return null;
              },
              onSaved: (valPassword) {
                setState(() {
                  _databasePassword = valPassword!;
                });
              }),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: IconButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  ref
                      .read(localDatabaseRepositoryProvider)
                      .insertRemoteDatabaseCredentials(
                          databaseName: _databaseName,
                          serverAdress: _serverAdress,
                          port: int.parse(_serverPort),
                          username: _databaseUser,
                          databasePassword: _databasePassword);
                  Future(() async {
                    ref
                        .read(localDatabaseRepositoryProvider)
                        .updateConfigurationState(true);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FinishConfig(),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.save_outlined),
              tooltip: "Guardar configuración",
            ),
          )
        ],
      ),
    );
  }
}
