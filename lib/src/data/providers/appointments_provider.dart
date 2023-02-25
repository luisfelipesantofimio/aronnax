import 'package:aronnax/src/data/interfaces/calendar_repository_interface.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/presentation/widgets/global_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Used by the [GlobalCalendar] widget for events exporting
final appointmentsListProvider = StateProvider<List<CalendarEvent>>(
  (ref) => [],
);

final selectedDateProvider = StateProvider(
  (ref) => DateTime.now(),
);

final appointmentsGlobalListProvider =
    FutureProvider.family<List<CalendarEvent>, WidgetRef>(
  (ref, state) =>
      ref.read(calendarRepositoryProvider).getCompleteEventsList(state),
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
