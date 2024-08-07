import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/calendar_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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

    return parsedCalendarEvents
        .where(
          (element) =>
              DateFormat('dd/MM/yyyy').format(element.date) ==
              DateFormat('dd/MM/yyyy').format(date),
        )
        .toList();
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

  @override
  Future<List<CalendarEvent>> getCompleteEventsList(WidgetRef ref) async {
    List<LocalAppointment> list =
        await ref.read(localDatabaseRepositoryProvider).getLocalAppointments();

    List<CalendarEvent> parsedCalendarEvents =
        list.map((e) => CalendarEvent.fromLocalModel(e)).toList();
    return parsedCalendarEvents;
  }

  @override
  void deleteEvent({required String eventID, required WidgetRef ref}) {
    ref.read(localDatabaseRepositoryProvider).deleteAppointments(eventID);
  }

  @override
  List<CalendarEvent> filterEventsByDate(
      List<CalendarEvent> snapshot, DateTime date) {
    return snapshot
        .where((element) =>
            DateFormat('dd/MM/yyyy').format(element.date) ==
            DateFormat('dd/MM/yyyy').format(date))
        .toList();
  }

  @override
  void updateEvent(WidgetRef ref, CalendarEvent eventData) {
    if (ref.read(offlineStatusProvider).value!) {
      ref
          .read(localDatabaseRepositoryProvider)
          .updateLocalAppointment(eventData: eventData);
    }
  }

  @override
  Future<int> deleteEventGroup(
      {required WidgetRef ref, required String groupId}) async {
    return await ref
        .read(localDatabaseRepositoryProvider)
        .deleteAppointmentsGroup(groupId: groupId);
  }
}
