import 'dart:developer';

import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/database/local_model/local_queries.dart';
import 'package:aronnax/src/data/interfaces/user_search_repository_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/consultations_provider.dart';
import 'package:aronnax/src/data/providers/patient_search_provider.dart';
import 'package:aronnax/src/domain/entities/remote_model/remote_patient.dart';
import 'package:aronnax/src/presentation/widgets/consultation_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalSelectedConsultantNamesProvider =
    StateProvider<String>((ref) => '');
final globalSelectedConsultantIDProvider = StateProvider<int>((ref) => 0);

class ConsultantSelectionDialog extends ConsumerStatefulWidget {
  const ConsultantSelectionDialog({
    Key? key,
    required this.title,
    required this.destinationRoute,
  }) : super(key: key);
  final String title;

  final Widget destinationRoute;

  @override
  ConsultantSelectionDialogState createState() =>
      ConsultantSelectionDialogState();
}

class ConsultantSelectionDialogState
    extends ConsumerState<ConsultantSelectionDialog> {
  String dataForQuery = "";
  @override
  Widget build(BuildContext context) {
    bool isOfflineEnabled = ref.watch(offlineStatusProvider).value!;

    List<LocalPatient> localPatientsListProvider = ref.watch(
      localQueriedPatientSearchListProvider,
    );
    List<RemotePatient>? remotePatientsList =
        isOfflineEnabled ? [] : ref.watch(globalQueriedPatientProvider);
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 186, 230, 230),
      content: SizedBox(
        width: 700,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            TextField(
              decoration:
                  const InputDecoration(hintText: "Nombre del consultante"),
              onChanged: (value) {
                isOfflineEnabled
                    ? ref
                        .read(userSearchRepositoryProvider)
                        .searchLocalUserByName(ref, value)
                    : ref
                        .read(globalQueriedPatientProvider.notifier)
                        .localQuery(dataForQuery);

                setState(() {
                  dataForQuery = value;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            Visibility(
              visible: dataForQuery != "",
              child: isOfflineEnabled
                  ? SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: localPatientsListProvider.length,
                        itemBuilder: (context, index) {
                          return ConsultationMenuElement(
                            name:
                                "${localPatientsListProvider.map((e) => e.names).toList()[index]} ${localPatientsListProvider.map((e) => e.lastNames).toList()[index]}",
                            idNumber: localPatientsListProvider
                                .map((e) => e.idNumber)
                                .toList()[index]
                                .toString(),
                            onTap: () async {
                              List<LocalClinicHistoryData>
                                  localClinicHistoryData =
                                  await localDB.clinicHistoryConsultation(
                                      localPatientsListProvider
                                          .map((e) => e.idNumber)
                                          .toList()[index]);

                              ref
                                  .read(globalSelectedConsultantIDProvider
                                      .notifier)
                                  .update((state) => localPatientsListProvider
                                      .map((e) => e.idNumber)
                                      .toList()[index]);
                              ref
                                  .read(globalSelectedConsultantNamesProvider
                                      .notifier)
                                  .update(
                                    (state) =>
                                        "${localPatientsListProvider.map((e) => e.names).toList()[index]} ${localPatientsListProvider.map((e) => e.lastNames).toList()[index]}",
                                  );

                              if (localClinicHistoryData.isEmpty) {
                                Future(
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          widget.destinationRoute,
                                    ),
                                  ),
                                );
                              } else {
                                Future(
                                  () => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                          'This user already has a clinic history.'),
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    )
                  : SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: remotePatientsList!.length,
                        itemBuilder: (context, index) {
                          return ConsultationMenuElement(
                            name:
                                "${remotePatientsList[index].names} ${remotePatientsList[index].lastNames}",
                            idNumber:
                                remotePatientsList[index].idNumber.toString(),
                            onTap: () {
                              ref
                                  .read(globalSelectedConsultantIDProvider
                                      .notifier)
                                  .update(
                                    (state) =>
                                        remotePatientsList[index].idNumber,
                                  );
                              ref
                                  .read(globalSelectedConsultantNamesProvider
                                      .notifier)
                                  .update(
                                    (state) =>
                                        "${remotePatientsList[index].names} ${remotePatientsList[index].lastNames}",
                                  );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => widget.destinationRoute,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
