import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/presentation/widgets/global_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Used by the [GlobalCalendar] widget for events exporting
final appointmentsListProvider = StateProvider<List<CalendarEvent>>(
  (ref) => [],
);

final appointmentDateProvider = StateProvider<DateTime?>(
  (ref) => DateTime.now(),
);

final appointmentPatientIdProvider = StateProvider<int?>(
  (ref) => null,
);
final appointmentDescriptionProvider = StateProvider<String?>(
  (ref) => null,
);

final appointmentStatusProvider =
    StateProvider<CalendarEventStates?>((ref) => null);

final appointmentTypeProvider =
    StateProvider<CalendarEventType?>((ref) => null);
