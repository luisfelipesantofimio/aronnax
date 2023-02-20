import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionsForm extends ConsumerStatefulWidget {
  const SessionsForm({Key? key, required this.patientID}) : super(key: key);
  final String patientID;

  @override
  SessionsFormState createState() => SessionsFormState();
}

class SessionsFormState extends ConsumerState<SessionsForm> {
  String sessionSummary = "";
  String sessionObjectives = "";
  String therapeuticArchievements = "";

  @override
  Widget build(BuildContext context) {
    bool isOfflineEnabled = ref.watch(globalOfflineStatusProvider);

    String professionalName =
        "${ref.read(globalUserNameProvider)} ${ref.read(globalUserLastNameProvider)}";

    return ListView(
      controller: ScrollController(),
      children: [
        Form(
          key: sessionFormKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Resumen de la sesión",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
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
                    labelText: "Objetivo de la sesión",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
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
                    labelText: "Logros terapéuticos",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
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
                    return null;
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       if (sessionKey.currentState!.validate()) {
              //         sessionKey.currentState!.save();

              //         isOfflineEnabled
              //             ? addLocalSession(
              //                 sessionSummary,
              //                 sessionObjectives,
              //                 therapeuticArchievements,
              //                 int.parse(widget.patientID),
              //                 ref.read(globalProfessionalPersonalIDProvider),
              //                 DateTime.now())
              //             : insertSessionData(
              //                 currentDate,
              //                 sessionSummary,
              //                 sessionObjectives,
              //                 therapeuticArchievements,
              //                 widget.patientID,
              //                 professionalName);
              //       }
              //     },
              //     child: const Text("Guardar información"),
              //   ),
              // ),
            ],
          ),
        )
      ],
    );
  }
}
