import 'package:aronnax/src/Pages/LoginScreen/login_form.dart';
import 'package:aronnax/src/database/local_model/local_queries.dart';
import 'package:flutter/material.dart';
import 'package:aronnax/src/API/server_api.dart';
import 'package:intl/intl.dart';

DateTime dateFormat = DateTime.now();
String currentDate = DateFormat("dd/MM/yyyy").format(dateFormat);

class SessionsForm extends StatefulWidget {
  const SessionsForm({Key? key}) : super(key: key);

  @override
  _SessionsFormState createState() => _SessionsFormState();
}

class _SessionsFormState extends State<SessionsForm> {
  final sessionKey = GlobalKey<FormState>();
  String sessionSummary = "";
  String sessionObjectives = "";
  String therapeuticArchievements = "";
  String idNumber = "";
  String professionalName = ("$globalUserName $globalUserLastNames");

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      children: [
        Form(
          key: sessionKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Resumen de la sesión",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valResume) {
                    setState(
                      () {
                        sessionSummary = valResume;
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
                    labelText: "Objetivo de la sesión",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valObjective) {
                    setState(
                      () {
                        sessionObjectives = valObjective;
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
                    labelText: "Logros terapéuticos",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valArchievement) {
                    setState(
                      () {
                        therapeuticArchievements = valArchievement;
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
                    labelText: "Documento del paciente",
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  onChanged: (valID) {
                    setState(
                      () {
                        idNumber = valID;
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
                    if (sessionKey.currentState!.validate()) {
                      sessionKey.currentState!.save();

                      isOfflineEnabled
                          ? addLocalSession(
                              sessionSummary,
                              sessionObjectives,
                              therapeuticArchievements,
                              int.parse(idNumber),
                              professionalName,
                              currentDate)
                          : insertSessionData(
                              currentDate,
                              sessionSummary,
                              sessionObjectives,
                              therapeuticArchievements,
                              idNumber,
                              professionalName);
                    }
                  },
                  child: const Text("Guardar información"),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
