import 'dart:developer';

import 'package:aronnax/src/Pages/ClinicHistory/consultation_provider/consultations_provider.dart';
import 'package:aronnax/src/Pages/ClinicHistory/widgets/clinic_history_confirm_password.dart';
import 'package:aronnax/src/Pages/ClinicHistory/widgets/clinic_history_no_clinic_history_dialog.dart';
import 'package:aronnax/src/Pages/Formulary/clinic_history/clinic_history_form_view.dart';
import 'package:aronnax/src/Pages/Formulary/widgets/consultant_selection_dialog.dart';
import 'package:aronnax/src/Pages/LoginScreen/login_form.dart';
import 'package:aronnax/src/database/local_model/local_model.dart';
import 'package:aronnax/src/database/local_model/local_queries.dart';
import 'package:aronnax/src/database/models/remote_clinic_history.dart';
import 'package:aronnax/src/database/models/remote_patient.dart';
import 'package:aronnax/src/misc/global_values.dart';
import 'package:aronnax/src/providers/patient_search_provider.dart';
import 'package:aronnax/src/widgets/consultation_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClinicHistorySearchForm extends ConsumerStatefulWidget {
  const ClinicHistorySearchForm({Key? key}) : super(key: key);

  @override
  ClinicHistorySearchFormState createState() => ClinicHistorySearchFormState();
}

class ClinicHistorySearchFormState
    extends ConsumerState<ClinicHistorySearchForm> {
  String dataForQuery = "";

  @override
  Widget build(BuildContext context) {
    List<RemotePatient> remotePatientsList =
        isOfflineEnabled ? [] : ref.watch(globalQueriedPatientProvider);
    AsyncValue<List<Patient>> userConsultationProvider = ref.watch(
      localPatientSearchProvider(dataForQuery),
    );
    return SizedBox(
      width: ref.watch(deviceWidth) * 0.35,
      child: Form(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      dataForQuery = value;
                    });
                    if (!isOfflineEnabled) {
                      ref
                          .read(globalQueriedPatientProvider.notifier)
                          .localQuery(value);
                    }
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            isOfflineEnabled
                ? Visibility(
                    child: userConsultationProvider.when(
                      data: (data) => SizedBox(
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ConsultationMenuElement(
                              name: data.map((e) => e.names).toList()[index],
                              idNumber: data
                                  .map((e) => e.idNumber)
                                  .toList()[index]
                                  .toString(),
                              onTap: () async {
                                List<ClinicHistoryData> localClinicHistoryData =
                                    await localDB.clinicHistoryConsultation(data
                                        .map((e) => e.idNumber)
                                        .toList()[index]);

                                if (localClinicHistoryData.isEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => NoClinicHistoryDialog(
                                      onPressed: () {
                                        setState(() {
                                          globalSelectedConsultantID = data
                                              .map((e) => e.idNumber)
                                              .toList()[index]
                                              .toString();
                                          globalSelectedConsultantNames =
                                              "${data.map((e) => e.names).toList()[index]} ${data.map((e) => e.lastNames).toList()[index]}";
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MainViewClinicHistory(),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const ClinicHistoryConfirmPasswordDialog(),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                      error: (error, stackTrace) => const Center(
                        child: Text("Algo salió mal :("),
                      ),
                      loading: () => const SizedBox(
                          height: 300, child: CircularProgressIndicator()),
                    ),
                  )
                : SizedBox(
                    height: 300,
                    child: Visibility(
                        visible: dataForQuery != "",
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: remotePatientsList.length,
                          itemBuilder: (context, index) {
                            return ConsultationMenuElement(
                              name:
                                  "${remotePatientsList[index].names} ${remotePatientsList[index].lastNames}",
                              idNumber:
                                  remotePatientsList[index].idNumber.toString(),
                              onTap: () {
                                ref
                                    .read(globalQueriedClinicHistoryProvider
                                        .notifier)
                                    .clinicHistoryQuery(
                                      remotePatientsList[index].idNumber,
                                    );
                                ref
                                    .read(
                                        globalQueriedSessionsProvider.notifier)
                                    .searchPatientSessions(
                                        remotePatientsList[index].idNumber);

                                List<RemoteClinicHistory> clinicHistoryList =
                                    ref.watch(
                                        globalQueriedClinicHistoryProvider);

                                if (clinicHistoryList.isEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => NoClinicHistoryDialog(
                                      onPressed: () {
                                        setState(() {
                                          globalSelectedConsultantID =
                                              remotePatientsList
                                                  .map((e) => e.idNumber)
                                                  .toList()[index]
                                                  .toString();
                                          globalSelectedConsultantNames =
                                              "${remotePatientsList.map((e) => e.names).toList()[index]} ${remotePatientsList.map((e) => e.lastNames).toList()[index]}";
                                        });

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MainViewClinicHistory(),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const ClinicHistoryConfirmPasswordDialog(),
                                  );
                                }
                              },
                            );
                          },
                        )),
                  ),
          ],
        ),
      ),
    );
  }
}
