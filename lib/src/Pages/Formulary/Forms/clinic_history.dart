import 'package:aronnax/src/API/server_api.dart';
import 'package:aronnax/src/Pages/LoginScreen/login_form.dart';
import 'package:aronnax/src/misc/passwd_generator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime dateFormat = DateTime.now();
String currentDate = DateFormat("dd/MM/yyyy").format(dateFormat);
String codeDate = DateFormat("ddMM").format(dateFormat);

String registerNewCode = registerGen(8);
String registerCode = "HC-$registerNewCode-$codeDate";

class ClinicHistory extends StatefulWidget {
  const ClinicHistory({Key? key}) : super(key: key);

  @override
  _ClinicHistoryState createState() => _ClinicHistoryState();
}

class _ClinicHistoryState extends State<ClinicHistory> {
  newRegisterCode() {
    String newCode = registerGen(8);
    setState(() {
      registerNewCode = newCode;
      registerCode = "HC-$registerNewCode-$codeDate";
    });
  }

  final _clinicHistoryKey = GlobalKey<FormState>();

  String reasonConsultation = "";
  String medAntecedents = "";
  String psiAntecedents = "";
  String mentalExamination = "";
  String personalHistory = "";
  String familyHistory = "";
  String diagnosticImpression = "";
  String treatmentPurpouse = "";
  String ID = "";
  String createdBy = ("$globalUserName $globalUserLastNames");

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      children: [
        Form(
          key: _clinicHistoryKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Motivo de consulta",
                      labelStyle: Theme.of(context).textTheme.bodyText2,
                      floatingLabelStyle:
                          Theme.of(context).textTheme.bodyText2),
                  onChanged: (value) {
                    setState(
                      () {
                        reasonConsultation = value;
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
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Examen mental",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        mentalExamination = value;
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
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Antecedentes psicológicos",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        psiAntecedents = value;
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
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Antecedentes médicos",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        medAntecedents = value;
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
                  maxLines: 10,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Historia personal",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        personalHistory = value;
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
                  maxLines: 10,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Historia familiar",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        familyHistory = value;
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
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Impresión diagnóstica",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        diagnosticImpression = value;
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
                  maxLines: 10,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Propuesta de tratamiento",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        treatmentPurpouse = value;
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
                    labelText: "Documento asociado a esta historia clínica:",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valID) {
                    setState(
                      () {
                        ID = valID;
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_clinicHistoryKey.currentState!.validate()) {
                      _clinicHistoryKey.currentState!.save();

                      insertClinicHistory(
                          registerCode,
                          currentDate,
                          reasonConsultation,
                          mentalExamination,
                          treatmentPurpouse,
                          medAntecedents,
                          psiAntecedents,
                          familyHistory,
                          personalHistory,
                          diagnosticImpression,
                          ID,
                          createdBy);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Historia guardada"),
                        ),
                      );
                      newRegisterCode();
                    }
                  },
                  child: const Text("Guardar historia clínica"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
