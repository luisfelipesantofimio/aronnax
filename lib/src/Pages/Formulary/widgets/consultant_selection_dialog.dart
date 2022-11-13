import 'package:aronnax/src/database/local_model/local_model.dart';
import 'package:aronnax/src/providers/patient_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String globalSelectedConsultantNames = "";
String globalSelectedConsultantID = "";

class ConsultantSelectionDialog extends ConsumerStatefulWidget {
  const ConsultantSelectionDialog({
    Key? key,
    required this.title,
    required this.destinationRoute,
  }) : super();
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
    AsyncValue<List<Patient>> userConsultationProvider = ref.watch(
      localPatientSearchProvider(dataForQuery),
    );

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
              },
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            Visibility(
                visible: dataForQuery != "",
                child: userConsultationProvider.when(
                  data: (data) => SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                globalSelectedConsultantID =
                                    data.map((e) => e.names).toList()[index];
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
                            child: Container(
                              height: 80,
                              width: 200,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 218, 204, 179),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 163, 163, 163),
                                    blurRadius: 6,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Nombre: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${data.map((e) => e.names).toList()[index]} ${data.map((e) => e.lastNames).toList()[index]}",
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Número de documento: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data
                                              .map((e) => e.idNumber)
                                              .toList()[index]
                                              .toString(),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  error: (error, stackTrace) =>
                      const Text("Algo ha salido mal :("),
                  loading: () => const CircularProgressIndicator(),
                )),
          ],
        ),
      ),
    );
  }
}
