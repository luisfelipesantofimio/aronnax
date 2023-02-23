import 'package:aronnax/src/data/repositories/calendar_repository.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CalendarRepositoryInterface {
  Future<List<CalendarEvent>> getListOfEventsByDay({
    required DateTime date,
    required bool isOfflineEnabled,
    required WidgetRef ref,
  });
  Future<List<CalendarEvent>> getListOfEventsByRange({
    required DateTime? start,
    required DateTime? end,
    required DateTime selectedDate,
    required bool isOfflineEnabled,
    required WidgetRef ref,
  });
}

final calendarRepositoryProvider = Provider<CalendarRepositoryInterface>(
  (ref) => CalendarRepository(),
);