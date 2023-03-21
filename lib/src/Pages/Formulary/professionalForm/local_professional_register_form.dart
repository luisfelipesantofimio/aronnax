
import 'package:aronnax/src/data/database/local_model/local_queries.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/location_data_provider.dart';

import 'package:aronnax/src/presentation/welcome_screens/finish.dart';
import 'package:country_state_city/country_state_city.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String _password = "";

final _hashedPassword = Crypt.sha256(_password);

class LocalProfessionalRegister extends ConsumerStatefulWidget {
  const LocalProfessionalRegister({Key? key}) : super(key: key);

  @override
  LocalProfessionalRegisterState createState() =>
      LocalProfessionalRegisterState();
}

class LocalProfessionalRegisterState
    extends ConsumerState<LocalProfessionalRegister> {
  final professionalKey = GlobalKey<FormState>();
  int personalID = 0;
  String names = "";
  String lastNames = "";
  int professionalID = 0;
  String userName = "";
  String selectedCountryCode = 'AF';
  get onChanged => null;

  @override
  Widget build(BuildContext context) {
    final countriesList = ref.watch(countriesListProvider);

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
                      personalID = int.parse(varID);
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
                    labelText: "Tarjeta profesional",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
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
                child: countriesList.when(
                  data: (data) => DropdownButtonFormField(
                    items: data
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                Text(e.flag),
                                Text(e.name),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    value: data.elementAt(data.indexWhere(
                        (element) => element.isoCode == selectedCountryCode)),
                    onChanged: (Country? value) {
                      setState(() {
                        selectedCountryCode = value!.isoCode;
                      });
                    },
                  ),
                  error: (error, stackTrace) => Row(
                    children: [
                      const Text('Something went wrong'),
                      TextButton(
                        onPressed: () => ref.invalidate(countriesListProvider),
                        child: const Text('Try again'),
                      ),
                    ],
                  ),
                  loading: () => const CircularProgressIndicator(),
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

                    addLocalProfessional(
                        personalID,
                        names,
                        lastNames,
                        professionalID,
                        userName,
                        _hashedPassword.toString(),
                        selectedCountryCode);

                    ref
                        .read(localDatabaseRepositoryProvider)
                        .updateConfigurationState(true);
                    ref
                        .read(localDatabaseRepositoryProvider)
                        .updateConnectionMode(true);

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
