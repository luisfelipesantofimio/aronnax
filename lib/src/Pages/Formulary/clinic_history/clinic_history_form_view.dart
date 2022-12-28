import 'package:aronnax/src/API/server_api.dart';
import 'package:aronnax/src/Pages/Formulary/Forms/clinic_history.dart';
import 'package:aronnax/src/Pages/Formulary/clinic_history/header.dart';
import 'package:aronnax/src/Pages/Formulary/widgets/consultant_selection_dialog.dart';
import 'package:aronnax/src/Pages/LoginScreen/login_form.dart';
import 'package:aronnax/src/database/local_model/local_queries.dart';
import 'package:aronnax/src/global/controllers.dart';
import 'package:aronnax/src/global/user_global_values.dart';
import 'package:aronnax/src/misc/passwd_generator.dart';
import 'package:aronnax/src/widgets/generic_global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainViewClinicHistory extends ConsumerWidget {
  const MainViewClinicHistory({Key? key, required this.patientID})
      : super(key: key);
  final String patientID;

  newRegisterCode() {
    String newCode = registerGen(8);

    registerNewCode = newCode;
    registerCode = "HC-$registerNewCode-$codeDate";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String createdBy =
        "${ref.read(globalUserNameProvider)} ${ref.read(globalUserLastNameProvider)}";
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: HeaderClinicHistory(
                  patientNames: globalSelectedConsultantNames),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Historia clínica",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 1000,
                    height: 500,
                    child: const ClinicHistory(),
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
                            if (clinicHistoryKey.currentState!.validate()) {
                              isOfflineEnabled
                                  ? addLocalClinicHistory(
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
                                      int.parse(patientID),
                                      createdBy)
                                  : insertClinicHistory(
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
                                      patientID,
                                      createdBy);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Historia guardada"),
                                ),
                              );
                              newRegisterCode();
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
