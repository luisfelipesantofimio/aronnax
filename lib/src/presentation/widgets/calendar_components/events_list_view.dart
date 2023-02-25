import 'package:aronnax/src/data/interfaces/calendar_repository_interface.dart';
import 'package:aronnax/src/data/providers/appointments_provider.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/presentation/widgets/event_list_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventsListView extends ConsumerWidget {
  const EventsListView({
    Key? key,
    required this.filtedEventsList,
  }) : super(key: key);
  final List<CalendarEvent> filtedEventsList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: filtedEventsList.isEmpty
          ? const Center(
              child: Text("No hay eventos para este día."),
            )
          : ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              itemCount: filtedEventsList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  height: 150,
                  child: EventListElement(
                    date: filtedEventsList[index].date,
                    eventStates: filtedEventsList[index].state,
                    calendarEventType: filtedEventsList[index].eventType,
                    patientId: filtedEventsList[index].patientID,
                    description: filtedEventsList[index].description,
                    onUpdate: () {},
                    onDelete: () {
                      ref.read(calendarRepositoryProvider).deleteEvent(
                          eventID: filtedEventsList[index].id, ref: ref);
                      ref.invalidate(appointmentsGlobalListProvider);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Evento eliminado.'),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
