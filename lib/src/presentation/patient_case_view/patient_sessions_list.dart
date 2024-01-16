import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/session.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class PatientSessionsList extends ConsumerWidget {
  const PatientSessionsList({
    super.key,
    required this.patientId,
    required this.caseId,
  });
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
        child: LayoutBuilder(
          builder: (context, constraints) => sessionsList.when(
            data: (data) {
              List<Session> filteredSessions = data
                  .where(
                    (element) => element.caseId == caseId,
                  )
                  .toList();
              return filteredSessions.isEmpty
                  ? const Center(
                      child: Text('There are no sessions related to this case'),
                    )
                  : ListView.builder(
                      itemCount: filteredSessions.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(10),
                                    ),
                                    Text(
                                      DateFormat('dd/MM/yyyy').format(
                                          filteredSessions[index].sessionDate),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(10),
                                    ),
                                    TextButton(
                                      onPressed: filteredSessions[index]
                                                  .sessionPerformanceExplanation ==
                                              null
                                          ? () {}
                                          : () {
                                              showDialog(
                                                context: context,
                                                builder: (context) => Dialog(
                                                  child: SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.6,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const Text(
                                                            'Explanation for this performance:',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                          ),
                                                          Text(filteredSessions[
                                                                      index]
                                                                  .sessionPerformanceExplanation ??
                                                              '')
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                      child: Text(
                                        'This was a ${AppMethods().getSessionPerformanceAsText(filteredSessions[index].sessionPerformance)} session',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppMethods()
                                              .getSessionPerformanceColor(
                                                  filteredSessions[index]
                                                      .sessionPerformance),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(10),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                const Text(
                                  'Session objectives: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.9,
                                  child: Text(filteredSessions[index]
                                      .sessionObjectives),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                const Text(
                                  'Session summary: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.9,
                                  child: Text(
                                      filteredSessions[index].sessionSummary),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                const Text(
                                  'Therapeutic archievements: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.9,
                                  child: Text(filteredSessions[index]
                                      .therapeuticArchievements),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                Visibility(
                                  visible:
                                      filteredSessions[index].sessionNotes !=
                                          null,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Notes:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.9,
                                        child: Text(filteredSessions[index]
                                                .sessionNotes ??
                                            ''),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                    ],
                                  ),
                                ),
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
      ),
    );
  }
}
