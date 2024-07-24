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
  Future<List<CalendarEvent>> getCompleteEventsList(
    WidgetRef ref,
  );

  List<CalendarEvent> filterEventsByDate(
      List<CalendarEvent> snapshot, DateTime date);

  void deleteEvent({
    required String eventID,
    required WidgetRef ref,
  });

  void updateEvent(WidgetRef ref, CalendarEvent eventData);

  Future<int> deleteEventGroup(
      {required WidgetRef ref, required String groupId});
}

final calendarRepositoryProvider = Provider<CalendarRepositoryInterface>(
  (ref) => CalendarRepository(),
);
