import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/remote_database/server_api.dart';
import 'package:aronnax/src/Pages/Formulary/Forms/basic_form.dart';
import 'package:aronnax/src/Pages/Formulary/basic_form/header.dart';
import 'package:aronnax/src/data/database/local_model/local_queries.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/widgets/generic_global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainViewRegister extends ConsumerWidget {
  const MainViewRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isOfflineEnabled = ref.watch(globalOfflineStatusProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: HeaderRegister(),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Información personal",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 1000,
                    height: 500,
                    child: const BasicForm(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        tooltip: "Volver",
                      ),
                      const Padding(padding: EdgeInsets.all(20)),
                      GenericGlobalButton(
                        height: 40,
                        width: 200,
                        title: "Guardar registro",
                        onPressed: () {
                          if (basicKey.currentState!.validate()) {
                            basicKey.currentState!.save();

                            isOfflineEnabled
                                ? addLocalPatient(
                                    names: names,
                                    lastNames: lastNames,
                                    adress: adress,
                                    birthDate: DateTime.now(),
                                    city: selectedCity,
                                    state: selectedState,
                                    insurance: insurance,
                                    education: education,
                                    mail: mail,
                                    idNumber: int.parse(ID),
                                    ocupation: ocupation,
                                    creationDate: DateTime.now(),
                                    contactNumber: int.parse(phoneNumber),
                                    emergencyContactName: emergencyContactName,
                                    emergencyContactNumber:
                                        int.parse(emergencyContactNumber),
                                    professionalID: ref.read(
                                        globalProfessionalPersonalIDProvider),
                                  )
                                : insertPatientData(
                                    names,
                                    lastNames,
                                    birthdate,
                                    ID,
                                    phoneNumber,
                                    mail,
                                    selectedCity,
                                    selectedState,
                                    adress,
                                    insurance,
                                    education,
                                    ocupation,
                                    emergencyContactName,
                                    emergencyContactNumber);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Información guardada"),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
