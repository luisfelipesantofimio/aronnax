import 'dart:developer';
import 'package:aronnax/src/Pages/ClinicHistory/widgets/clinic_history_confirm_password.dart';
import 'package:aronnax/src/Pages/ClinicHistory/widgets/clinic_history_no_clinic_history_dialog.dart';
import 'package:aronnax/src/Pages/Formulary/widgets/consultant_selection_dialog.dart';
import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/database/local_model/local_queries.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/consultations_provider.dart';
import 'package:aronnax/src/data/providers/patient_search_provider.dart';
import 'package:aronnax/src/domain/entities/remote_model/remote_clinic_history.dart';
import 'package:aronnax/src/domain/entities/remote_model/remote_patient.dart';
import 'package:aronnax/src/presentation/clinic_history_form_screen/clinic_history_register_view.dart';
import 'package:aronnax/src/presentation/widgets/consultation_element.dart';
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
    bool isOfflineEnabled = ref.watch(globalOfflineStatusProvider);
    List<RemotePatient> remotePatientsList =
        isOfflineEnabled ? [] : ref.watch(globalQueriedPatientProvider);
    List<LocalPatient> localPatientsList = ref.watch(
      localQueriedPatientSearchListProvider,
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
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
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: localPatientsList.length,
                        itemBuilder: (context, index) {
                          return ConsultationMenuElement(
                            name: localPatientsList
                                .map((e) => e.names)
                                .toList()[index],
                            idNumber: localPatientsList
                                .map((e) => e.idNumber)
                                .toList()[index]
                                .toString(),
                            onTap: () async {
                              List<LocalClinicHistoryData>
                                  localClinicHistoryData =
                                  await localDB.clinicHistoryConsultation(
                                      localPatientsList
                                          .map((e) => e.idNumber)
                                          .toList()[index]);
                              ref
                                  .read(localQueriedClinicHistoryProvider
                                      .notifier)
                                  .searchLocalClinicHistory(localPatientsList
                                      .map((e) => e.idNumber)
                                      .toList()[index]);
                              ref
                                  .read(localQueriedSessionsProvider.notifier)
                                  .searchLocalSessions(localPatientsList
                                      .map((e) => e.idNumber)
                                      .toList()[index]);
                              log("Is local clinic history empty? ${localClinicHistoryData.isEmpty}");

                              if (localClinicHistoryData.isEmpty) {
                                Future(
                                  () => showDialog(
                                    context: context,
                                    builder: (context) => NoClinicHistoryDialog(
                                      onPressed: () {
                                        ref
                                            .read(
                                                globalSelectedConsultantIDProvider
                                                    .notifier)
                                            .update(
                                              (state) => localPatientsList
                                                  .map((e) => e.idNumber)
                                                  .toList()[index],
                                            );
                                        ref
                                            .read(
                                                globalSelectedConsultantNamesProvider
                                                    .notifier)
                                            .update(
                                              (state) =>
                                                  '${localPatientsList.map((e) => e.names).toList()[index]} ${localPatientsList.map((e) => e.lastNames).toList()[index]}',
                                            );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ClinicHistoryRegisterView(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                Future(
                                  () => showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const ClinicHistoryConfirmPasswordDialog(),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
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
                                        ref
                                            .read(
                                                globalSelectedConsultantIDProvider
                                                    .notifier)
                                            .update(
                                              (state) => remotePatientsList
                                                  .map((e) => e.idNumber)
                                                  .toList()[index],
                                            );
                                        ref
                                            .read(
                                                globalSelectedConsultantNamesProvider
                                                    .notifier)
                                            .update(
                                              (state) =>
                                                  '${remotePatientsList.map((e) => e.names).toList()[index]} ${remotePatientsList.map((e) => e.lastNames).toList()[index]}',
                                            );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ClinicHistoryRegisterView(),
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
