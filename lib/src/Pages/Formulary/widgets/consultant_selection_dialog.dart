import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/models/remote_patient.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/consultations_provider.dart';
import 'package:aronnax/src/data/providers/patient_search_provider.dart';
import 'package:aronnax/src/widgets/consultation_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String globalSelectedConsultantNames = "";
String globalSelectedConsultantID = "";

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
    bool isOfflineEnabled = ref.watch(globalOfflineStatusProvider);
    AsyncValue<List<Patient>> userConsultationProvider = ref.watch(
      localPatientSearchProvider(dataForQuery),
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
                setState(() {
                  dataForQuery = value;
                });
                !isOfflineEnabled
                    ? ref
                        .read(globalQueriedPatientProvider.notifier)
                        .localQuery(dataForQuery)
                    : "";
              },
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            Visibility(
              visible: dataForQuery != "",
              child: isOfflineEnabled
                  ? userConsultationProvider.when(
                      data: (data) => SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ConsultationMenuElement(
                              name:
                                  "${data.map((e) => e.names).toList()[index]} ${data.map((e) => e.lastNames).toList()[index]}",
                              idNumber: data
                                  .map((e) => e.idNumber)
                                  .toList()[index]
                                  .toString(),
                              onTap: () {
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
                                          widget.destinationRoute,
                                    ));
                              },
                            );
                          },
                        ),
                      ),
                      error: (error, stackTrace) =>
                          const Text("Algo ha salido mal :("),
                      loading: () => const CircularProgressIndicator(),
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
                              setState(() {
                                globalSelectedConsultantID =
                                    remotePatientsList[index]
                                        .idNumber
                                        .toString();
                                globalSelectedConsultantNames =
                                    "${remotePatientsList[index].names} ${remotePatientsList[index].lastNames}";
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        widget.destinationRoute,
                                  ));
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
