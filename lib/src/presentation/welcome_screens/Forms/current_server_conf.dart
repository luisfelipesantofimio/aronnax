import 'package:aronnax/main.dart';
import 'package:aronnax/src/data/database/settings_db/settings.dart';
import 'package:aronnax/src/presentation/welcome_screens/finish.dart';
import 'package:flutter/material.dart';

class ExistingServerForm extends StatefulWidget {
  const ExistingServerForm({Key? key}) : super(key: key);

  @override
  State<ExistingServerForm> createState() => _ExistingServerFormState();
}

class _ExistingServerFormState extends State<ExistingServerForm> {
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
                  // localdb.put(
                  //   "serverSettings",
                  //   ServerSettings(_databaseUser, _databasePassword,
                  //       _databaseName, _serverAdress, _serverPort, true),
                  // );
                  // offlineModeDB.put(
                  //   "offlineModeDB",
                  //   LocalDatabaseMode(false),
                  // );
                  RemoteDatabaseAccess serverData = RemoteDatabaseAccess()
                    ..databaseName = _databaseName
                    ..server = _serverAdress
                    ..port = _serverPort
                    ..userName = _databaseUser
                    ..password = _databasePassword;

                  Future(
                    () async {
                      await isar.writeTxn(() async {
                        await isar.remoteDatabaseAccess.put(serverData);
                      });

                      await isar.writeTxn(() async {
                        final item = await isar.settings.get(0);
                        item!.isOfflineModeEnabled = false;

                        await isar.settings.put(item);
                      });
                    },
                  );

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
