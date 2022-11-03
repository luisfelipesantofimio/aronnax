import 'dart:developer';

import 'package:aronnax/src/Pages/LoginScreen/login_form.dart';
import 'package:aronnax/src/database/local_model/local_queries.dart';
import 'package:aronnax/src/providers/global_providers.dart';
import 'package:aronnax/src/widgets/date_selector.dart';
import 'package:flutter/material.dart';
import 'package:aronnax/src/API/server_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BasicForm extends ConsumerStatefulWidget {
  const BasicForm({Key? key}) : super(key: key);

  @override
  BasicFormState createState() => BasicFormState();
}

class BasicFormState extends ConsumerState<BasicForm> {
  final basicKey = GlobalKey<FormState>();

  var defaultPhoto = const AssetImage("assets/img/unknown-user.png");

  var patientPhoto = "";

  String names = "";
  String lastNames = "";
  // ignore: non_constant_identifier_names
  String ID = "";
  String birthdate = "";
  DateTime currentDate = DateTime.now();
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  String phoneNumber = "";
  String mail = "";
  String state = "";
  String city = "";
  String ocupation = "";
  String education = "";
  String adress = "";
  String insurance = "";
  String emergencyContactName = "";
  String emergencyContactNumber = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(), //sin Controller no hay lista
      children: [
        Form(
          key: basicKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Nombres",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valNames) {
                    setState(
                      () {
                        names = valNames;
                      },
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Apellidos",
                      labelStyle: Theme.of(context).textTheme.bodyText2),
                  onChanged: (valLastNames) {
                    setState(
                      () {
                        lastNames = valLastNames;
                      },
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Cédula",
                      labelStyle: Theme.of(context).textTheme.bodyText2),
                  onChanged: (valID) {
                    setState(
                      () {
                        ID = valID;
                      },
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Número de contacto",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valPhone) {
                    setState(
                      () {
                        phoneNumber = valPhone;
                      },
                    );
                  },
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(20),
                  child: DateSelector(
                      date: currentDate,
                      onChanged: (valDate) {
                        setState(() {
                          currentDate = valDate;
                          birthdate = formatter.format(currentDate);
                        });
                      })),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Correo electrónico",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valMail) {
                    setState(
                      () {
                        mail = valMail;
                      },
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Departamento de residencia",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valState) {
                    setState(
                      () {
                        state = valState;
                      },
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Municipio de residencia",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valCity) {
                    setState(
                      () {
                        city = valCity;
                      },
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Dirección",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valAdress) {
                    setState(
                      () {
                        adress = valAdress;
                      },
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Escolaridad",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valStudies) {
                    setState(
                      () {
                        education = valStudies;
                      },
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Ocupación",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valOcupation) {
                    setState(
                      () {
                        ocupation = valOcupation;
                      },
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "EPS",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valInsurance) {
                    setState(
                      () {
                        insurance = valInsurance;
                      },
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Nombre de contacto de emergencia",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valEmergencyName) {
                    setState(
                      () {
                        emergencyContactName = valEmergencyName;
                      },
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Número de contacto de emergencia",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (emergencyNumber) {
                    setState(
                      () {
                        emergencyContactNumber = emergencyNumber;
                      },
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (basicKey.currentState!.validate()) {
                      basicKey.currentState!.save();

                      isOfflineEnabled
                          ? addLocalPatient(
                              names,
                              lastNames,
                              birthdate,
                              int.parse(ID),
                              int.parse(phoneNumber),
                              mail,
                              city,
                              state,
                              adress,
                              insurance,
                              education,
                              ocupation,
                              emergencyContactName,
                              int.parse(emergencyContactNumber))
                          : insertPatientData(
                              names,
                              lastNames,
                              birthdate,
                              ID,
                              phoneNumber,
                              mail,
                              city,
                              state,
                              adress,
                              insurance,
                              education,
                              ocupation,
                              emergencyContactName,
                              emergencyContactNumber);
                      if (basicKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Información guardada"),
                          ),
                        );
                      } else {
                        null;
                      }
                    }
                  },
                  child: const Text("Guardar información"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
