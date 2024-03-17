import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  final String patientId;
  final String caseId;

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
                  ? Center(
                      child: Text(AppLocalizations.of(context)!
                          .patientCaseSessionEmptyList),
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
                                      '${AppLocalizations.of(context)!.genericSession} #${index + 1}',
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
                                                          Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .patientCaseSessionPerformanceExplanation,
                                                            style: const TextStyle(
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
                                        '${AppLocalizations.of(context)!.genericThisWasPrefix} ${AppMethods().getSessionPerformanceAsText(filteredSessions[index].sessionPerformance)} ${AppLocalizations.of(context)!.genericSession.toLowerCase()}',
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
                                Text(
                                  AppLocalizations.of(context)!
                                      .sessionFormFieldSessionGoal,
                                  style: const TextStyle(
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
                                Text(
                                  AppLocalizations.of(context)!
                                      .sessionFormFieldSessionSummary,
                                  style: const TextStyle(
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
                                Text(
                                  AppLocalizations.of(context)!
                                      .sessionFormFieldTherapeuticArchievements,
                                  style: const TextStyle(
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
                                      Text(
                                        AppLocalizations.of(context)!
                                            .genericNotes,
                                        style: const TextStyle(
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
            error: (error, stackTrace) =>
                Text(AppLocalizations.of(context)!.genericErrorMessage),
            loading: () => const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
