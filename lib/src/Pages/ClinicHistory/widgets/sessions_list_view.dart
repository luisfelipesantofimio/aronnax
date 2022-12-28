import 'package:aronnax/src/Pages/ClinicHistory/widgets/sessions_list_element.dart';
import 'package:aronnax/src/Pages/LoginScreen/login_form.dart';
import 'package:aronnax/src/database/local_model/local_model.dart';
import 'package:aronnax/src/database/models/remode_session_resume.dart';
import 'package:flutter/material.dart';

class SessionsListView extends StatelessWidget {
  const SessionsListView(
      {Key? key, required this.remoteSessions, required this.localSessions})
      : super(key: key);

  final List<RemoteSession> remoteSessions;
  final List<Session> localSessions;

  @override
  Widget build(BuildContext context) {
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
                    ? localSessions[index].sessionDate
                    : remoteSessions[index].dateTime,
                sessionProfessional: isOfflineEnabled
                    ? localSessions[index].professionalName
                    : remoteSessions[index].professionalName,
              ),
            );
          },
        );
      },
    );
  }
}
