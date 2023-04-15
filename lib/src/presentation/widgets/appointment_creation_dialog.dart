import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/appointments_provider.dart';
import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/presentation/core/constants.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AppointmentCreationDialog extends ConsumerStatefulWidget {
  const AppointmentCreationDialog({
    Key? key,
    required this.selectedDate,
  }) : super(key: key);
  final DateTime selectedDate;

  @override
  ConsumerState<AppointmentCreationDialog> createState() =>
      _AppointmentCreationDialogState();
}

class _AppointmentCreationDialogState
    extends ConsumerState<AppointmentCreationDialog> {
  Color? itemColor;
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedHour = TimeOfDay.now();

  @override
  void initState() {
    appointmentCreationKey.currentState?.initState();
    Future(() {
      ref.read(appointmentPatientIdProvider.notifier).update(
            (state) => null,
          );
      ref.read(appointmentDescriptionProvider.notifier).update(
            (state) => null,
          );
      ref.read(appointmentStatusProvider.notifier).update(
            (state) => null,
          );
      ref.read(appointmentTypeProvider.notifier).update(
            (state) => null,
          );
      setState(() {
        selectedDate = widget.selectedDate;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    appointmentCreationKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final patientsList = ref.watch(patientsListProvider);

    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Form(
          key: appointmentCreationKey,
          child: Row(
            children: [
              Container(
                width: 10,
                color: itemColor ?? Colors.grey,
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Agendar evento',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    const Text('Fecha:'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('dd/MM/yyyy').format(
                            selectedDate ?? DateTime.now(),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        TextButton(
                          onPressed: () async {
                            selectedDate = await showDatePicker(
                              context: context,
                              initialDate: selectedDate ?? DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 10),
                              lastDate: DateTime(DateTime.now().year + 10),
                            );

                            setState(() {});
                          },
                          child: const Text(
                            'Seleccionar',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const Text('Hora:'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(selectedHour!.format(context)),
                        const Padding(padding: EdgeInsets.all(5)),
                        TextButton(
                          onPressed: () async {
                            selectedHour = await showTimePicker(
                              context: context,
                              initialTime: selectedHour ?? TimeOfDay.now(),
                            );

                            setState(() {});
                          },
                          child: const Text(
                            'Seleccionar',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    const Text('Seleccionar consultante'),
                    SizedBox(
                      width: 250,
                      child: patientsList.when(
                        data: (data) => DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return 'Debes seleccionar un consultante';
                            }
                            return null;
                          },
                          hint: const Text('Consultante'),
                          isExpanded: true,
                          items: data
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text('${e.names} ${e.lastNames}'),
                                ),
                              )
                              .toList(),
                          onChanged: (Patient? value) {
                            appointmentCreationKey.currentState?.validate();
                            ref
                                .read(appointmentPatientIdProvider.notifier)
                                .update((state) => value!.idNumber);
                          },
                        ),
                        error: (error, stackTrace) =>
                            const Text('Something went wrong.'),
                        loading: () => const CircularProgressIndicator(),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        maxLines: 2,
                        decoration: const InputDecoration(
                            hintText: 'Descripción del evento'),
                        onChanged: (value) => ref
                            .read(appointmentDescriptionProvider.notifier)
                            .update(
                              (state) => value,
                            ),
                      ),
                    ),
                    GenericMinimalButton(
                      title: 'Agendar',
                      onTap: () {
                        if (appointmentCreationKey.currentState!.validate() &&
                            ref.read(appointmentStatusProvider) != null &&
                            ref.read(appointmentTypeProvider) != null) {
                          ref
                              .read(localDatabaseRepositoryProvider)
                              .addLocalAppointMent(
                                  date: DateTime(
                                    selectedDate!.year,
                                    selectedDate!.month,
                                    selectedDate!.day,
                                    selectedHour!.hour,
                                    selectedHour!.minute,
                                  ),
                                  professionalId: ref
                                      .read(globalUserInformationProvider)!
                                      .personalID,
                                  patientId:
                                      ref.read(appointmentPatientIdProvider)!,
                                  description:
                                      ref.read(appointmentDescriptionProvider),
                                  state: ref.read(appointmentStatusProvider)!,
                                  eventType:
                                      ref.read(appointmentTypeProvider)!);
                          ref.invalidate(appointmentsGlobalListProvider);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('Evento creado'),
                            ),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                  '¡Debes seleccionar un estado y un tipo de evento!'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Estado del evento"),
                      RadioListTile(
                        title: const Text("Agendado"),
                        value: CalendarEventStates.scheduled,
                        groupValue: ref.watch(appointmentStatusProvider),
                        onChanged: (CalendarEventStates? value) {
                          ref.read(appointmentStatusProvider.notifier).update(
                                (state) => value,
                              );
                        },
                      ),
                      RadioListTile(
                        title: const Text("Realizado"),
                        value: CalendarEventStates.done,
                        groupValue: ref.watch(appointmentStatusProvider),
                        onChanged: (CalendarEventStates? value) {
                          ref.read(appointmentStatusProvider.notifier).update(
                                (state) => value,
                              );
                        },
                      ),
                      RadioListTile(
                        title: const Text("Cancelado"),
                        value: CalendarEventStates.cancelled,
                        groupValue: ref.watch(appointmentStatusProvider),
                        onChanged: (CalendarEventStates? value) {
                          ref.read(appointmentStatusProvider.notifier).update(
                                (state) => value,
                              );
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      const Text("Tipo de evento"),
                      RadioListTile(
                        title: const Text("Reunión"),
                        value: CalendarEventType.meeting,
                        groupValue: ref.watch(appointmentTypeProvider),
                        onChanged: (CalendarEventType? value) {
                          ref
                              .read(appointmentTypeProvider.notifier)
                              .update((state) => value);
                          setState(() {
                            itemColor =
                                const Color.fromARGB(255, 232, 219, 181);
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text("Consulta"),
                        value: CalendarEventType.consultation,
                        groupValue: ref.watch(appointmentTypeProvider),
                        onChanged: (CalendarEventType? value) {
                          ref
                              .read(appointmentTypeProvider.notifier)
                              .update((state) => value);
                          setState(() {
                            itemColor =
                                const Color.fromARGB(255, 138, 194, 227);
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text("Seguimiento"),
                        value: CalendarEventType.following,
                        groupValue: ref.watch(appointmentTypeProvider),
                        onChanged: (CalendarEventType? value) {
                          ref
                              .read(appointmentTypeProvider.notifier)
                              .update((state) => value);
                          setState(() {
                            itemColor =
                                const Color.fromARGB(255, 153, 221, 190);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
