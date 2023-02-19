import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime dateFormat = DateTime.now();
String currentDate = DateFormat("dd/MM/yyyy").format(dateFormat);
String codeDate = DateFormat("ddMM").format(dateFormat);

String registerNewCode = AppMethods().codeGeneration(8);
String registerCode = "HC-$registerNewCode-$codeDate";

//Clinic history values
String reasonConsultation = "";
String medAntecedents = "";
String psiAntecedents = "";
String mentalExamination = "";
String personalHistory = "";
String familyHistory = "";
String diagnosticImpression = "";
String treatmentPurpouse = "";

class ClinicHistoryRegisterForm extends StatefulWidget {
  const ClinicHistoryRegisterForm({Key? key}) : super(key: key);

  @override
  State<ClinicHistoryRegisterForm> createState() =>
      _ClinicHistoryRegisterFormState();
}

class _ClinicHistoryRegisterFormState extends State<ClinicHistoryRegisterForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          key: clinicHistoryKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Motivo de consulta",
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      floatingLabelStyle:
                          Theme.of(context).textTheme.bodyMedium),
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
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Examen mental",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
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
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Antecedentes psicológicos",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
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
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Antecedentes médicos",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
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
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 10,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Historia personal",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
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
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 10,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Historia familiar",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
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
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Impresión diagnóstica",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
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
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 10,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Propuesta de tratamiento",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
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
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
