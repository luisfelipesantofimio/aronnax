import 'package:aronnax/src/presentation/appointment_creation/widgets/event_date_time_selection.dart';
import 'package:aronnax/src/presentation/appointment_creation/widgets/event_days_selector.dart';
import 'package:aronnax/src/presentation/appointment_creation/widgets/patient_evet_selection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/calendar_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/appointments_provider.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/presentation/appointment_creation/widgets/event_status_selector.dart';
import 'package:aronnax/src/presentation/core/constants.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentCreationDialog extends ConsumerStatefulWidget {
  const AppointmentCreationDialog(
      {Key? key, required this.selectedDate, required this.eventData})
      : super(key: key);
  final DateTime selectedDate;
  final CalendarEvent? eventData;

  @override
  ConsumerState<AppointmentCreationDialog> createState() =>
      _AppointmentCreationDialogState();
}

class _AppointmentCreationDialogState
    extends ConsumerState<AppointmentCreationDialog> {
  int numberOfWeeks = 1;
  bool multiEventSelection = false;
  Color? itemColor;
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedHour = TimeOfDay.now();

  @override
  void initState() {
    appointmentCreationKey.currentState?.initState();
    if (widget.eventData != null) {
      Future(() {
        ref.read(appointmentPatientIdProvider.notifier).update(
              (state) => widget.eventData!.patientID,
            );
        ref.read(appointmentDescriptionProvider.notifier).update(
              (state) => widget.eventData!.description,
            );
        ref.read(appointmentStatusProvider.notifier).update(
              (state) => widget.eventData!.state,
            );
        ref.read(appointmentTypeProvider.notifier).update(
              (state) => widget.eventData!.eventType,
            );
        setState(() {
          selectedDate = widget.eventData!.date;
          selectedHour = TimeOfDay.fromDateTime(widget.eventData!.date);
        });
      });
    } else {
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
    }
    super.initState();
  }

  @override
  void dispose() {
    appointmentCreationKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Form(
          key: appointmentCreationKey,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10,
                color: itemColor ?? Colors.grey,
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EventDaysSelector(
                      eventData: widget.eventData,
                      onMultiEventSelection: (multipleEvents) {
                        setState(() {
                          multiEventSelection = multipleEvents;
                        });
                      },
                      onSelectedWeeks: (number) {
                        setState(() {
                          numberOfWeeks = number;
                        });
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    EventDateTimeSelection(
                      onSelectedDate: (date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                      onSelectedTime: (time) {
                        setState(() {
                          selectedHour = time;
                        });
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Text(AppLocalizations.of(context)!
                        .genericPatientSelectionTitlte),
                    PatientEventSelection(
                      eventData: widget.eventData,
                      onSelectedPatient: (patient) {
                        appointmentCreationKey.currentState?.validate();
                        ref
                            .read(appointmentPatientIdProvider.notifier)
                            .update((state) => patient!.id);
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        initialValue: widget.eventData != null
                            ? widget.eventData!.description
                            : null,
                        maxLines: 2,
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!
                                .calendarEventFormDescription),
                        onChanged: (value) => ref
                            .read(appointmentDescriptionProvider.notifier)
                            .update(
                              (state) => value,
                            ),
                      ),
                    ),
                    GenericMinimalButton(
                      title: AppLocalizations.of(context)!
                          .calendarEventScheduleButtonTitle,
                      onTap: () {
                        if (appointmentCreationKey.currentState!.validate() &&
                            ref.read(appointmentStatusProvider) != null &&
                            ref.read(appointmentTypeProvider) != null) {
                          if (widget.eventData == null) {
                            if (multiEventSelection) {
                              ref
                                  .read(localDatabaseRepositoryProvider)
                                  .addMultiLocalAppointMent(
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
                                    description: ref
                                        .read(appointmentDescriptionProvider),
                                    state: ref.read(appointmentStatusProvider)!,
                                    eventType:
                                        ref.read(appointmentTypeProvider)!,
                                    numberOfRepetitions: numberOfWeeks,
                                  );
                              ref.invalidate(appointmentsGlobalListProvider);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(
                                    AppLocalizations.of(context)!
                                        .calendarEventCreationConfirmationText,
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            } else {
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
                                          .id,
                                      patientId: ref
                                          .read(appointmentPatientIdProvider)!,
                                      description: ref
                                          .read(appointmentDescriptionProvider),
                                      state:
                                          ref.read(appointmentStatusProvider)!,
                                      eventType:
                                          ref.read(appointmentTypeProvider)!);
                              ref.invalidate(appointmentsGlobalListProvider);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(AppLocalizations.of(context)!
                                      .calendarEventCreationConfirmationText),
                                ),
                              );
                              Navigator.pop(context);
                            }
                          } else {
                            CalendarEvent updatedEvent = widget.eventData!
                                .copyWith(
                                    date: DateTime(
                                      selectedDate!.year,
                                      selectedDate!.month,
                                      selectedDate!.day,
                                      selectedHour!.hour,
                                      selectedHour!.minute,
                                    ),
                                    professionalID: ref
                                        .read(globalUserInformationProvider)!
                                        .id,
                                    patientID:
                                        ref.read(appointmentPatientIdProvider)!,
                                    description: ref
                                        .read(appointmentDescriptionProvider),
                                    state: ref.read(appointmentStatusProvider)!,
                                    eventType:
                                        ref.read(appointmentTypeProvider)!);
                            ref
                                .read(calendarRepositoryProvider)
                                .updateEvent(ref, updatedEvent);
                            ref.invalidate(appointmentsGlobalListProvider);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(AppLocalizations.of(context)!
                                    .calendarEventUpdateConfirmationText),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(AppLocalizations.of(context)!
                                  .calendarEventFormErrorNoOptionsSelected),
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
                  child: EventStatusSelector(
                    onColorSelected: (color) {
                      setState(() {
                        itemColor = color;
                      });
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
