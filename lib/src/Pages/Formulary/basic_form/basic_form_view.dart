import 'dart:developer';

import 'package:aronnax/src/API/server_api.dart';
import 'package:aronnax/src/Pages/Formulary/Forms/basic_form.dart';
import 'package:aronnax/src/Pages/Formulary/basic_form/header.dart';
import 'package:aronnax/src/Pages/LoginScreen/login_form.dart';
import 'package:aronnax/src/database/local_model/local_queries.dart';
import 'package:aronnax/src/global/controllers.dart';
import 'package:aronnax/src/widgets/generic_global_button.dart';
import 'package:flutter/material.dart';

class MainViewRegister extends StatelessWidget {
  const MainViewRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    style: Theme.of(context).textTheme.headline2,
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
                                      names,
                                      lastNames,
                                      birthdate,
                                      int.parse(ID),
                                      int.parse(phoneNumber),
                                      mail,
                                      selectedCity,
                                      selectedState,
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
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
