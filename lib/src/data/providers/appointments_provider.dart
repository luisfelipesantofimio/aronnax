import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/presentation/widgets/global_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Used by the [GlobalCalendar] widget for events exporting
final appointmentsListProvider = StateProvider<List<CalendarEvent>>(
  (ref) => [],
);
