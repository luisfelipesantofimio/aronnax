import 'package:aronnax/src/data/interfaces/calendar_repository_interface.dart';
import 'package:aronnax/src/data/providers/appointments_provider.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class GlobalCalendar extends ConsumerStatefulWidget {
  const GlobalCalendar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<GlobalCalendar> createState() => _GlobalCalendarState();
}

class _GlobalCalendarState extends ConsumerState<GlobalCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime _userSelectedDay = DateTime.now();
  DateTime? _rangeStartDay;
  DateTime? _rangeEndDay;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOff;
  List<CalendarEvent> currentEvents = [];

  List<CalendarEvent> _getEventsByDay(DateTime day) {
    return ref
        .watch(appointmentsGlobalListProvider(ref))
        .value!
        .where(
          (element) =>
              DateFormat('dd/MM/yyyy').format(element.date) ==
              DateFormat('dd/MM/yyyy').format(day),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 200, 200, 200),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TableCalendar<CalendarEvent>(
          calendarStyle: const CalendarStyle(
            outsideDaysVisible: true,
            markersMaxCount: 1,
            markerDecoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            dowTextFormatter: (date, locale) {
              return DateFormat.E(locale).format(date)[0].toUpperCase();
            },
          ),
          firstDay: DateTime(DateTime.now().year - 10),
          lastDay: DateTime(DateTime.now().year + 10),
          rangeStartDay: _rangeStartDay,
          rangeEndDay: _rangeEndDay,
          focusedDay: _focusedDay,

          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
          ),
          onDaySelected: (selectedDay, focusedDay) async {
            setState(() {
              _focusedDay = focusedDay;
              _userSelectedDay = selectedDay;

              rangeSelectionMode = RangeSelectionMode.toggledOff;
            });

            List<CalendarEvent> eventsList = await ref
                .read(calendarRepositoryProvider)
                .getListOfEventsByDay(
                    date: selectedDay,
                    isOfflineEnabled: ref.read(globalOfflineStatusProvider),
                    ref: ref);
            ref
                .read(appointmentsListProvider.notifier)
                .update((state) => eventsList);
            ref.read(selectedDateProvider.notifier).update(
                  (state) => selectedDay,
                );
          },
          selectedDayPredicate: (day) {
            return isSameDay(_userSelectedDay, day);
          },
          rangeSelectionMode: rangeSelectionMode,
          // onRangeSelected: (start, end, focusedDay) async {
          //   setState(() {
          //     rangeSelectionMode = RangeSelectionMode.toggledOn;
          //   });
          //   List<CalendarEvent> eventsList = await ref
          //       .read(calendarRepositoryProvider)
          //       .getListOfEventsByRange(
          //           start: start,
          //           end: end,
          //           selectedDate: focusedDay,
          //           isOfflineEnabled: ref.read(globalOfflineStatusProvider),
          //           ref: ref);

          //   ref
          //       .read(appointmentsListProvider.notifier)
          //       .update((state) => eventsList);
          // },
          eventLoader: (day) => _getEventsByDay(day),
          locale: 'es',
        ),
      ),
    );
  }
}
