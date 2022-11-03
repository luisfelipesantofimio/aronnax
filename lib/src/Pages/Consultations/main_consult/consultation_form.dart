import 'dart:developer';

import 'package:aronnax/src/API/server_api.dart';
import 'package:aronnax/src/Pages/LoginScreen/login_form.dart';
import 'package:aronnax/src/database/local_model/local_model.dart';
import 'package:aronnax/src/providers/patient_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../clinic_history_consultation/clinic_history_data.dart';

String dataForQuery = "";
ValueNotifier<String> textNames = ValueNotifier("");
ValueNotifier<String> textLastNames = ValueNotifier("");
ValueNotifier<String> textID = ValueNotifier("");
ValueNotifier<String> textBirthDate = ValueNotifier("");
ValueNotifier<String> textContactNumber = ValueNotifier("");
ValueNotifier<String> textMail = ValueNotifier("");
ValueNotifier<String> textCity = ValueNotifier("");
ValueNotifier<String> textState = ValueNotifier("");
ValueNotifier<String> textAdress = ValueNotifier("");
ValueNotifier<String> textEducation = ValueNotifier("");
ValueNotifier<String> textOcupation = ValueNotifier("");
ValueNotifier<String> textInsurance = ValueNotifier("");
ValueNotifier<String> textEmergencyName = ValueNotifier("");
ValueNotifier<String> textEmergencyNumb = ValueNotifier("");
String textPassword = "";
var db = MySQL();

class ShowQuery extends ConsumerStatefulWidget {
  const ShowQuery({Key? key}) : super(key: key);
  static ValueNotifier<bool> isSearchDefined = ValueNotifier<bool>(false);

  @override
  _ShowQueryState createState() => _ShowQueryState();
}

class _ShowQueryState extends ConsumerState<ShowQuery> {
  getPatientInfo(data) {
    db.getConnection().then((conn) {
      String queryNames = "select names from patients where idNumber = $data";
      String queryLastNames =
          "select lastNames from patients where idNumber = $data";
      String queryID = "select idNumber from patients where idNumber = $data";
      String queryBirthDate =
          "select birthDate from patients where idNumber = $data";
      String queryContactNumber =
          "select contactNumber from patients where idNumber = $data";
      String queryMail = "select mail from patients where idNumber = $data";
      String queryCity = "select city from patients where idNumber = $data";
      String queryState = "select state from patients where idNumber = $data";
      String queryAdress = "select adress from patients where idNumber = $data";
      String queryEducation =
          "select education from patients where idNumber = $data";
      String queryOcupation =
          "select ocupation from patients where idNumber = $data";
      String queryInsurance =
          "select insurance from patients where idNumber = $data";
      String queryEmergencyContactName =
          "select emergencyContactName from patients where idNumber = $data";
      String queryEmergencyContactNumb =
          "select emergencyContactNumber from patients where idNumber = $data";
//////
      String queryRegister =
          "select registerCode from clinic_history where idNumber = $data";
      String queryDate =
          "select dateTime from clinic_history where idNumber = $data";
      String queryConsultationReason =
          "select consultationReason from clinic_history where idNumber = $data";
      String queryMentalExamn =
          "select mentalExamn from clinic_history where idNumber = $data";
      String queryTreatment =
          "select treatment from clinic_history where idNumber = $data";
      String queryMedAntecedents =
          "select medAntecedents from clinic_history where idNumber = $data";
      String queryPsyAntecedents =
          "select psiAntecedents from clinic_history where idNumber = $data";
      String queryFamilyHistory =
          "select familyHistory from clinic_history where idNumber = $data";
      String queryPersonalHistory =
          "select personalHistory from clinic_history where idNumber = $data";
      String queryDiagnostic =
          "select diagnostic from clinic_history where idNumber = $data";
      String queryCreator =
          "select createdBy from clinic_history where idNumber = $data";

      conn.query(queryRegister).then((results) {
        for (var row in results) {
          setState(() {
            currentRegister.value = row[0];
          });
        }
      });
      conn.query(queryDate).then((results) {
        for (var row in results) {
          setState(() {
            currentDate.value = row[0];
          });
        }
      });
      conn.query(queryConsultationReason).then((results) {
        for (var row in results) {
          setState(() {
            currentConsultationReason.value = row[0].toString();
          });
        }
      });

      conn.query(queryMentalExamn).then((results) {
        for (var row in results) {
          setState(() {
            currentMentalExamn.value = row[0].toString();
          });
        }
      });
      conn.query(queryTreatment).then((results) {
        for (var row in results) {
          setState(() {
            currentTreatment.value = row[0].toString();
          });
        }
      });
      conn.query(queryConsultationReason).then((results) {
        for (var row in results) {
          setState(() {
            currentConsultationReason.value = row[0].toString();
          });
        }
      });
      conn.query(queryMedAntecedents).then((results) {
        for (var row in results) {
          setState(() {
            currentMedAntecedents.value = row[0].toString();
          });
        }
      });
      conn.query(queryPsyAntecedents).then((results) {
        for (var row in results) {
          setState(() {
            currentPsyAntecedents.value = row[0].toString();
          });
        }
      });
      conn.query(queryFamilyHistory).then((results) {
        for (var row in results) {
          setState(() {
            currentFamilyHistory.value = row[0].toString();
          });
        }
      });
      conn.query(queryPersonalHistory).then((results) {
        for (var row in results) {
          setState(() {
            currentPersonalHistory.value = row[0].toString();
          });
        }
      });
      conn.query(queryDiagnostic).then((results) {
        for (var row in results) {
          setState(() {
            currentDiagnostic.value = row[0].toString();
          });
        }
      });
      conn.query(queryCreator).then((results) {
        for (var row in results) {
          setState(() {
            creator.value = row[0];
          });
        }
      });

      ///

      conn.query(queryNames).then((results) {
        for (var row in results) {
          setState(() {
            textNames.value = row[0];
          });
        }
      });
      conn.query(queryLastNames).then((results) {
        for (var row in results) {
          setState(() {
            textLastNames.value = row[0];
          });
        }
      });
      conn.query(queryID).then((results) {
        for (var row in results) {
          setState(() {
            textID.value = row[0].toString();
          });
        }
      });
      conn.query(queryBirthDate).then((results) {
        for (var row in results) {
          setState(() {
            textBirthDate.value = row[0];
          });
        }
      });
      conn.query(queryContactNumber).then((results) {
        for (var row in results) {
          setState(() {
            textContactNumber.value = row[0];
          });
        }
      });
      conn.query(queryMail).then((results) {
        for (var row in results) {
          setState(() {
            textMail.value = row[0];
          });
        }
      });
      conn.query(queryCity).then((results) {
        for (var row in results) {
          setState(() {
            textCity.value = row[0];
          });
        }
      });
      conn.query(queryState).then((results) {
        for (var row in results) {
          setState(() {
            textState.value = row[0];
          });
        }
      });
      conn.query(queryAdress).then((results) {
        for (var row in results) {
          setState(() {
            textAdress.value = row[0];
          });
        }
      });
      conn.query(queryEducation).then((results) {
        for (var row in results) {
          setState(() {
            textEducation.value = row[0];
          });
        }
      });
      conn.query(queryOcupation).then((results) {
        for (var row in results) {
          setState(() {
            textOcupation.value = row[0];
          });
        }
      });
      conn.query(queryInsurance).then((results) {
        for (var row in results) {
          setState(() {
            textInsurance.value = row[0];
          });
        }
      });
      conn.query(queryEmergencyContactName).then((results) {
        for (var row in results) {
          setState(() {
            textEmergencyName.value = row[0];
          });
        }
      });
      conn.query(queryEmergencyContactNumb).then((results) {
        for (var row in results) {
          setState(() {
            textEmergencyNumb.value = row[0];
          });
        }
        log(currentConsultationReason.value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _queryKey = GlobalKey<FormState>();
    AsyncValue<List<Patient>> userConsultationProvider = ref.watch(
      localPatientSearchProvider(dataForQuery),
    );

    return Form(
      key: _queryKey,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextFormField(
              style: Theme.of(context).textTheme.bodyText2,
              onChanged: (value) {
                setState(() {
                  dataForQuery = value;
                });
              },
              onSaved: (value) {
                setState(() {
                  dataForQuery = value!;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Ingresa un valor";
                }
              },
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Número de cédula",
                labelStyle: Theme.of(context).textTheme.bodyText2,
                floatingLabelStyle: Theme.of(context).textTheme.bodyText2,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: dataForQuery != "",
            child: userConsultationProvider.when(
              data: (data) {
                // log(data.toString());
                // log(data.map((e) => e.names).toList().first);
                // if (data.isNotEmpty) {
                //   textNames.value = data.map((e) => e.names).toList().first;
                //   textLastNames.value =
                //       data.map((e) => e.lastNames).toList().first;
                //   textID.value =
                //       data.map((e) => e.idNumber).toList().first.toString();
                //   textBirthDate.value =
                //       data.map((e) => e.birthDate).toList().first;
                //   textContactNumber.value = data
                //       .map((e) => e.contactNumber)
                //       .toList()
                //       .first
                //       .toString();
                //   textMail.value = data.map((e) => e.mail).toList().first;
                //   textAdress.value = data.map((e) => e.adress).toList().first;
                //   textCity.value = data.map((e) => e.city).toList().first;
                //   textState.value = data.map((e) => e.state).toList().first;
                //   textEducation.value =
                //       data.map((e) => e.education).toList().first;
                //   textOcupation.value =
                //       data.map((e) => e.ocupation).toList().first;
                //   textInsurance.value =
                //       data.map((e) => e.insurance).toList().first;
                //   textEmergencyName.value =
                //       data.map((e) => e.emergencyContactName).toList().first;
                //   textEmergencyNumb.value = data
                //       .map((e) => e.emergencyContactNumber)
                //       .toList()
                //       .first
                //       .toString();
                // currentRegister.value = "";
                // currentDate.value = "";
                // currentConsultationReason.value = "";
                // currentMentalExamn.value = "";
                // currentTreatment.value = "";
                // currentMedAntecedents.value = "";
                // currentPsyAntecedents.value = "";
                // currentFamilyHistory.value = "";
                // currentPersonalHistory.value = "";
                // currentDiagnostic.value = "";
                //}

                return ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          ShowQuery.isSearchDefined.value = true;
                          textNames.value =
                              data.map((e) => e.names).toList()[index];
                          textLastNames.value =
                              data.map((e) => e.lastNames).toList()[index];
                          textID.value = data
                              .map((e) => e.idNumber)
                              .toList()[index]
                              .toString();
                          textBirthDate.value =
                              data.map((e) => e.birthDate).toList()[index];
                          textContactNumber.value = data
                              .map((e) => e.contactNumber)
                              .toList()[index]
                              .toString();
                          textMail.value =
                              data.map((e) => e.mail).toList()[index];
                          textAdress.value =
                              data.map((e) => e.adress).toList()[index];
                          textCity.value =
                              data.map((e) => e.city).toList()[index];
                          textState.value =
                              data.map((e) => e.state).toList()[index];
                          textEducation.value =
                              data.map((e) => e.education).toList()[index];
                          textOcupation.value =
                              data.map((e) => e.ocupation).toList()[index];
                          textInsurance.value =
                              data.map((e) => e.insurance).toList()[index];
                          textEmergencyName.value = data
                              .map((e) => e.emergencyContactName)
                              .toList()[index];
                          textEmergencyNumb.value = data
                              .map((e) => e.emergencyContactNumber)
                              .toList()[index]
                              .toString();
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 300,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text(
                              data.map((e) => e.names).toList()[index],
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              data
                                  .map((e) => e.idNumber)
                                  .toList()[index]
                                  .toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              error: (error, stackTrace) => const SizedBox(),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  tooltip: "Buscar paciente",
                  onPressed: () async {
                    if (_queryKey.currentState!.validate()) {
                      _queryKey.currentState!.save();
                      isOfflineEnabled
                          ? log("message")
                          : getPatientInfo(dataForQuery);
                      ShowQuery.isSearchDefined.value = true;
                    }
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  tooltip: "Limpiar búsqueda",
                  onPressed: () async {
                    ShowQuery.isSearchDefined.value = false;
                    setState(() {
                      textNames.value = "";
                      textLastNames.value = "";
                      textID.value = "";
                      textBirthDate.value = "";
                      textContactNumber.value = "";
                      textMail.value = "";
                      textAdress.value = "";
                      textCity.value = "";
                      textState.value = "";
                      textEducation.value = "";
                      textOcupation.value = "";
                      textInsurance.value = "";
                      textEmergencyName.value = "";
                      textEmergencyNumb.value = "";
                      currentRegister.value = "";
                      currentDate.value = "";
                      currentConsultationReason.value = "";
                      currentMentalExamn.value = "";
                      currentTreatment.value = "";
                      currentMedAntecedents.value = "";
                      currentPsyAntecedents.value = "";
                      currentFamilyHistory.value = "";
                      currentPersonalHistory.value = "";
                      currentDiagnostic.value = "";
                    });
                  },
                  icon: const Icon(Icons.cleaning_services),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
