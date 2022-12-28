//Data model for remote session resumes

import 'package:mysql1/mysql1.dart';

class RemoteSession {
  final int sessionId;
  final String dateTime;
  final String sessionSummary;
  final String sessionObjectives;
  final String therapeuticArchievements;
  final int idNumber;
  final String professionalName;

  RemoteSession(
      {required this.sessionId,
      required this.dateTime,
      required this.sessionSummary,
      required this.sessionObjectives,
      required this.therapeuticArchievements,
      required this.idNumber,
      required this.professionalName});

  factory RemoteSession.fromJson(Map<String, dynamic> data) {
    final sessionId = data["sessionId"] as int?;
    final dateTime = data["dateTime"] as String?;
    final sessionSummary = data["sessionSummary"] as Blob?;
    final sessionObjectives = data["sessionObjectives"] as Blob?;
    final therapeuticArchievements = data["therapeuticArchievements"] as Blob?;
    final idNumber = data["idNumber"] as int?;
    final professionalName = data["professionalName"] as String?;
    return RemoteSession(
        sessionId: sessionId!,
        dateTime: dateTime!,
        sessionSummary: sessionSummary.toString(),
        sessionObjectives: sessionObjectives.toString(),
        therapeuticArchievements: therapeuticArchievements.toString(),
        idNumber: idNumber!,
        professionalName: professionalName!);
  }
}
