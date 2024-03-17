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
  final String id;
  final DateTime date;
  final CalendarEventStates state;
  final CalendarEventType eventType;
  final String? description;
  final String professionalID;
  final String patientID;
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

  CalendarEvent copyWith({
    String? id,
    DateTime? date,
    CalendarEventStates? state,
    CalendarEventType? eventType,
    String? description,
    String? professionalID,
    String? patientID,
  }) {
    return CalendarEvent(
      id: id ?? this.id,
      date: date ?? this.date,
      state: state ?? this.state,
      eventType: eventType ?? this.eventType,
      description: description ?? this.description,
      professionalID: professionalID ?? this.professionalID,
      patientID: patientID ?? this.patientID,
    );
  }

  @override
  String toString() {
    return 'CalendarEvent(id: $id, date: $date, state: $state, eventType: $eventType, description: $description, professionalID: $professionalID, patientID: $patientID)';
  }

  @override
  bool operator ==(covariant CalendarEvent other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.date == date &&
        other.state == state &&
        other.eventType == eventType &&
        other.description == description &&
        other.professionalID == professionalID &&
        other.patientID == patientID;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        state.hashCode ^
        eventType.hashCode ^
        description.hashCode ^
        professionalID.hashCode ^
        patientID.hashCode;
  }
}
