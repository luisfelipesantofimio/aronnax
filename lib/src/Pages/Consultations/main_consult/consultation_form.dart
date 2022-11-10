import 'dart:developer';

import 'package:aronnax/src/Pages/Consultations/consultation_provider/consultations_provider.dart';
import 'package:aronnax/src/Pages/LoginScreen/login_form.dart';
import 'package:aronnax/src/database/local_model/local_model.dart';
import 'package:aronnax/src/database/remote_model/remote_patient.dart';
import 'package:aronnax/src/providers/patient_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../clinic_history_consultation/clinic_history_data.dart';

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

class ShowQuery extends ConsumerStatefulWidget {
  const ShowQuery({Key? key}) : super(key: key);
  static ValueNotifier<bool> isSearchDefined = ValueNotifier<bool>(false);

  @override
  ShowQueryState createState() => ShowQueryState();
}

class ShowQueryState extends ConsumerState<ShowQuery> {
  @override
  Widget build(BuildContext context) {
    String dataForQuery = "";
    int selectedIdNumber = 0;

    final _queryKey = GlobalKey<FormState>();
    AsyncValue<List<Patient>> userConsultationProvider = ref.watch(
      localPatientSearchProvider(dataForQuery),
    );

    List<RemotePatient> searchedPatientData =
        ref.watch(globalQueriedPatientProvider);

    log("Datos obtenidos desde el provider: $searchedPatientData");
    ref
        .read(globalQueriedClinicHistoryProvider.notifier)
        .getPatientInfo(selectedIdNumber);

    return Form(
      //  setState(() {
      //       textNames.value = row.fields["names"];
      //       textLastNames.value = row.fields["lastNames"];
      //       textID.value = row.fields["idNumber"].toString();
      //       textContactNumber.value = row.fields["contactNumber"];
      //       textAdress.value = row.fields["adress"];
      //       textMail.value = row.fields["mail"];
      //       textBirthDate.value = row.fields["birthDate"];
      //       textCity.value = row.fields["city"];
      //       textState.value = row.fields["state"];
      //       textEducation.value = row.fields["education"];
      //       textOcupation.value = row.fields["ocupation"];
      //       textInsurance.value = row.fields["insurance"];
      //       textEmergencyName.value = row.fields["emergencyContactName"];
      //       textEmergencyNumb.value = row.fields["emergencyContactNumber"];
      //     });

      // currentDate.value = row.fields["dateTime"];
      // currentRegister.value = row.fields["registerCode"];
      // currentConsultationReason.value = row.fields["consultationReason"];
      // currentMentalExamn.value = "";
      // currentDiagnostic.value = "";
      // currentFamilyHistory.value = "";
      // currentPersonalHistory.value = "";
      // currentPsyAntecedents.value = "";
      // currentMedAntecedents.value = "";
      // creator.value = "";
      key: _queryKey,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextFormField(
              style: Theme.of(context).textTheme.bodyText2,
              onChanged: (value) {
                dataForQuery = value;

                ref
                    .read(globalQueriedPatientProvider.notifier)
                    .getPatientInfo(dataForQuery);
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
              visible: searchedPatientData.isNotEmpty,
              //dataForQuery.text != "",
              child: isOfflineEnabled
                  ? userConsultationProvider.when(
                      data: (data) {
                        if (data.isNotEmpty) {
                          textNames.value =
                              data.map((e) => e.names).toList().first;
                          textLastNames.value =
                              data.map((e) => e.lastNames).toList().first;
                          textID.value = data
                              .map((e) => e.idNumber)
                              .toList()
                              .first
                              .toString();
                          textBirthDate.value =
                              data.map((e) => e.birthDate).toList().first;
                          textContactNumber.value = data
                              .map((e) => e.contactNumber)
                              .toList()
                              .first
                              .toString();
                          textMail.value =
                              data.map((e) => e.mail).toList().first;
                          textAdress.value =
                              data.map((e) => e.adress).toList().first;
                          textCity.value =
                              data.map((e) => e.city).toList().first;
                          textState.value =
                              data.map((e) => e.state).toList().first;
                          textEducation.value =
                              data.map((e) => e.education).toList().first;
                          textOcupation.value =
                              data.map((e) => e.ocupation).toList().first;
                          textInsurance.value =
                              data.map((e) => e.insurance).toList().first;
                          textEmergencyName.value = data
                              .map((e) => e.emergencyContactName)
                              .toList()
                              .first;
                          textEmergencyNumb.value = data
                              .map((e) => e.emergencyContactNumber)
                              .toList()
                              .first
                              .toString();
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
                        }

                        return ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            log("Funciona");
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  ShowQuery.isSearchDefined.value = true;
                                  textNames.value =
                                      data.map((e) => e.names).toList()[index];
                                  textLastNames.value = data
                                      .map((e) => e.lastNames)
                                      .toList()[index];
                                  textID.value = data
                                      .map((e) => e.idNumber)
                                      .toList()[index]
                                      .toString();
                                  textBirthDate.value = data
                                      .map((e) => e.birthDate)
                                      .toList()[index];
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
                                  textEducation.value = data
                                      .map((e) => e.education)
                                      .toList()[index];
                                  textOcupation.value = data
                                      .map((e) => e.ocupation)
                                      .toList()[index];
                                  textInsurance.value = data
                                      .map((e) => e.insurance)
                                      .toList()[index];
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
                    )
                  : SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: searchedPatientData.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          log(searchedPatientData.length.toString());
                          return InkWell(
                            onTap: () {
                              setState(() {
                                ShowQuery.isSearchDefined.value = true;
                                textNames.value =
                                    searchedPatientData[index].names;
                                textLastNames.value =
                                    searchedPatientData[index].lastNames;
                                textID.value = searchedPatientData[index]
                                    .idNumber
                                    .toString();

                                textBirthDate.value =
                                    searchedPatientData[index].birthDate;

                                textContactNumber.value =
                                    searchedPatientData[index].contactNumber;

                                textMail.value =
                                    searchedPatientData[index].mail;

                                textAdress.value =
                                    searchedPatientData[index].adress;

                                textCity.value =
                                    searchedPatientData[index].city;

                                textState.value =
                                    searchedPatientData[index].state;

                                textEducation.value =
                                    searchedPatientData[index].education;

                                textOcupation.value =
                                    searchedPatientData[index].ocupation;

                                textInsurance.value =
                                    searchedPatientData[index].insurance;

                                textEmergencyName.value =
                                    searchedPatientData[index]
                                        .emergencyContactName;

                                textEmergencyNumb.value =
                                    searchedPatientData[index]
                                        .emergencyContactNumber;
                                selectedIdNumber =
                                    searchedPatientData[index].idNumber;
                                // currentDate.value =
                                //     searchedClinicHistoryData[index].dateTime;
                                // currentRegister.value =
                                //     searchedClinicHistoryData[index]
                                //         .registerCode;
                                // currentConsultationReason.value =
                                //     searchedClinicHistoryData[index]
                                //         .consultationReason;
                                // currentMentalExamn.value =
                                //     searchedClinicHistoryData[index]
                                //         .mentalExamn;
                                // currentDiagnostic.value =
                                //     searchedClinicHistoryData[index].diagnostic;
                                // currentFamilyHistory.value =
                                //     searchedClinicHistoryData[index]
                                //         .familyHistory;
                                // currentPersonalHistory.value =
                                //     searchedClinicHistoryData[index]
                                //         .personalHistory;
                                // currentPsyAntecedents.value =
                                //     searchedClinicHistoryData[index]
                                //         .psyAntecedents;
                                // currentMedAntecedents.value =
                                //     searchedClinicHistoryData[index]
                                //         .medAntecedents;
                                // creator.value =
                                //     searchedClinicHistoryData[index].createdBy;
                              });

                              ref
                                  .read(globalQueriedPatientProvider.notifier)
                                  .cleanCurrentList();
                            },
                            child: Container(
                              height: 100,
                              width: 300,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Text(
                                    searchedPatientData[index].names,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    searchedPatientData[index]
                                        .idNumber
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  tooltip: "Buscar paciente",
                  onPressed: () {
                    if (_queryKey.currentState!.validate()) {
                      _queryKey.currentState!.save();

                      log("Consultando con datos: ${dataForQuery}");
                      ref
                          .read(globalQueriedPatientProvider.notifier)
                          .getPatientInfo(dataForQuery);

                      isOfflineEnabled ? log("message") : "";
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
                  onPressed: () {
                    ShowQuery.isSearchDefined.value = false;
                    ref
                        .read(globalQueriedPatientProvider.notifier)
                        .cleanCurrentList();
                    ref
                        .read(globalQueriedClinicHistoryProvider.notifier)
                        .cleanCurrentClinicHistoryList();

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
