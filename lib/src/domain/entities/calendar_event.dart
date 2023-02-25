// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/presentation/core/methods.dart';

enum CalendarEventStates {
  scheduled,
  cancelled,
  done,
}

enum CalendarEventType {
  consultation,
  meeting,
  following,
}

class CalendarEvent {
  final int id;
  final DateTime date;
  final CalendarEventStates state;
  final CalendarEventType eventType;
  final String? description;
  final int professionalID;
  final int patientID;
  CalendarEvent({
    required this.id,
    required this.date,
    required this.state,
    required this.eventType,
    required this.description,
    required this.professionalID,
    required this.patientID,
  });

  factory CalendarEvent.fromLocalModel(LocalAppointment data) {
    return CalendarEvent(
      id: data.id,
      patientID: data.patientID,
      professionalID: data.professionalID,
      date: data.date,
      state: AppMethods().parseCalendarEventStateFromString(data.status),
      description: data.description,
      eventType:
          AppMethods().parseCalendarEventTypeFromString(data.sessionType),
    );
  }
}
