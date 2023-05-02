import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/domain/entities/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class PatientSessionsList extends ConsumerWidget {
  const PatientSessionsList({
    Key? key,
    required this.patientId,
    required this.caseId,
  }) : super(key: key);
  final int patientId;
  final int caseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsList = ref.watch(
      patientsSessionsProvider(patientId),
    );
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.6,
        child: sessionsList.when(
          data: (data) {
            List<Session> filteredSessions = data
                .where(
                  (element) => element.caseId == caseId,
                )
                .toList();
            return ListView.builder(
                itemCount: filteredSessions.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 218, 218, 218),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Session #${index + 1}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(20),
                              ),
                              Text(
                                DateFormat('dd/MM/yyyy').format(
                                    filteredSessions[index].sessionDate),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(filteredSessions[index].sessionObjectives),
                          Text(filteredSessions[index].sessionSummary),
                        ],
                      ),
                    ),
                  );
                });
          },
          error: (error, stackTrace) => const Text('Something went wrong'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
