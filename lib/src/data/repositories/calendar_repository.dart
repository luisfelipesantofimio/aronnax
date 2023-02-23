import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/calendar_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarRepository implements CalendarRepositoryInterface {
  @override
  Future<List<CalendarEvent>> getListOfEventsByDay({
    required DateTime date,
    required bool isOfflineEnabled,
    required WidgetRef ref,
  }) async {
    List<LocalAppointment> list =
        await ref.read(localDatabaseRepositoryProvider).getLocalAppointments();

    List<CalendarEvent> parsedCalendarEvents =
        list.map((e) => CalendarEvent.fromLocalModel(e)).toList();
    Future<List<CalendarEvent>> filteredList = Future.value(parsedCalendarEvents
        .where(
          (element) => element.date == date,
        )
        .toList());
    return filteredList;
  }

  @override
  Future<List<CalendarEvent>> getListOfEventsByRange({
    required DateTime? start,
    required DateTime? end,
    required DateTime selectedDate,
    required bool isOfflineEnabled,
    required WidgetRef ref,
  }) async {
    List<LocalAppointment> list =
        await ref.read(localDatabaseRepositoryProvider).getLocalAppointments();

    List<CalendarEvent> parsedCalendarEvents =
        list.map((e) => CalendarEvent.fromLocalModel(e)).toList();
    Future<List<CalendarEvent>> filteredList = Future.value(parsedCalendarEvents
        .where(
          (element) =>
              element.date.isAfter(start!) && element.date.isBefore(end!),
        )
        .toList());
    return filteredList;
  }
}
