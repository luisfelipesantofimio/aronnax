// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/presentation/core/methods.dart';

class EventListElement extends ConsumerStatefulWidget {
  const EventListElement({
    Key? key,
    required this.date,
    required this.eventStates,
    required this.calendarEventType,
    this.description,
    required this.patientId,
    required this.onDelete,
    required this.onUpdate,
  }) : super(key: key);
  final DateTime date;
  final CalendarEventStates eventStates;
  final CalendarEventType calendarEventType;
  final String? description;
  final int patientId;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  @override
  ConsumerState<EventListElement> createState() => _EventListElementState();
}

class _EventListElementState extends ConsumerState<EventListElement> {
  bool isMouseHover = false;
  @override
  Widget build(BuildContext context) {
    final patientsList = ref.watch(patientsListProvider);
    Patient foundPatient = patientsList.value!.elementAt(
      patientsList.value!
          .indexWhere((element) => element.idNumber == widget.patientId),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: constraints.maxWidth * 0.001,
                decoration: BoxDecoration(
                  color:
                      AppMethods().setEventTypeColor(widget.calendarEventType),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppMethods()
                            .parseCalendarEventTypeFromEnum(
                                widget.calendarEventType)
                            .substring(0, 1)
                            .toUpperCase() +
                        AppMethods()
                            .parseCalendarEventTypeFromEnum(
                                widget.calendarEventType)
                            .substring(1),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 2,
                      bottom: 2,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: AppMethods()
                            .setEventStatusColor(widget.eventStates)),
                    child: Text(
                        AppMethods()
                                .parseCalendarEventStateFromEnum(
                                    widget.eventStates)
                                .substring(0, 1)
                                .toUpperCase() +
                            AppMethods()
                                .parseCalendarEventStateFromEnum(
                                    widget.eventStates)
                                .substring(1),
                        style: const TextStyle(fontSize: 12)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(3),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.4,
                    child: Text(
                      "${foundPatient.names} ${foundPatient.lastNames}",
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: constraints.maxWidth * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        child: Text(
                      DateFormat.yMMMMEEEEd("es").format(widget.date),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Text(DateFormat.Hm("es").format(widget.date)),
                    Text(widget.description ?? 'Sin descripción'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  right: 10,
                ),
                child: MouseRegion(
                  onEnter: (event) => setState(() {
                    isMouseHover = true;
                  }),
                  onExit: (event) => setState(() {
                    isMouseHover = false;
                  }),
                  child: AnimatedContainer(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: isMouseHover
                            ? const Color.fromARGB(255, 243, 84, 73)
                            : const Color.fromARGB(255, 241, 142, 135),
                      ),
                      width: isMouseHover
                          ? MediaQuery.of(context).size.width * 0.08
                          : MediaQuery.of(context).size.width * 0.04,
                      duration: const Duration(milliseconds: 200),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 10, right: 10),
                          child: isMouseHover
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      tooltip: 'Acutalizar',
                                      onPressed: widget.onUpdate,
                                      icon: const Icon(
                                        Icons.update,
                                      ),
                                    ),
                                    IconButton(
                                      tooltip: 'Eliminar',
                                      onPressed: widget.onDelete,
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                )
                              : const Icon(FontAwesomeIcons.bars),
                        ),
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
