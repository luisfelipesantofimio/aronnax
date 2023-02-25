import 'package:aronnax/src/Pages/ClinicHistory/widgets/sessions_list_element.dart';
import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/domain/entities/remote_model/remode_session_resume.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionsListView extends ConsumerWidget {
  const SessionsListView(
      {Key? key, required this.remoteSessions, required this.localSessions})
      : super(key: key);

  final List<RemoteSession> remoteSessions;
  final List<LocalSession> localSessions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isOfflineEnabled = ref.watch(globalOfflineStatusProvider);
    return DraggableScrollableSheet(
      initialChildSize: 1,
      maxChildSize: 1,
      minChildSize: 0.1,
      expand: true,
      builder: (context, scrollController) {
        return ListView.builder(
          controller: scrollController,
          itemCount:
              isOfflineEnabled ? localSessions.length : remoteSessions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SessionsListElement(
                itemIndex: index,
                sessionSummary: isOfflineEnabled
                    ? localSessions[index].sessionSummary
                    : remoteSessions[index].sessionSummary,
                sessionArchievements: isOfflineEnabled
                    ? localSessions[index].therapeuticArchievements
                    : remoteSessions[index].therapeuticArchievements,
                sessionObjectives: isOfflineEnabled
                    ? localSessions[index].sessionObjectives
                    : remoteSessions[index].sessionObjectives,
                sessionID: isOfflineEnabled
                    ? localSessions[index].sessionId
                    : remoteSessions[index].sessionId,
                sessionDate: isOfflineEnabled
                    ? localSessions[index].sessionDate.toString()
                    : remoteSessions[index].dateTime,
                sessionProfessional: isOfflineEnabled
                    ? localSessions[index].professionalID.toString()
                    : remoteSessions[index].professionalName,
              ),
            );
          },
        );
      },
    );
  }
}
