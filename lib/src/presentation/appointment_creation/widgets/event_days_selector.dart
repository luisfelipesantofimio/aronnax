import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventDaysSelector extends StatefulWidget {
  const EventDaysSelector({
    super.key,
    required this.eventData,
    required this.onSelectedWeeks,
    required this.onMultiEventSelection,
  });
  final CalendarEvent? eventData;
  final void Function(int numberOfWeeks) onSelectedWeeks;
  final void Function(bool multipleEvents) onMultiEventSelection;

  @override
  State<EventDaysSelector> createState() => _EventDaysSelectorState();
}

class _EventDaysSelectorState extends State<EventDaysSelector> {
  bool multiEventSelection = false;
  int numberOfWeeks = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.eventData == null
              ? AppLocalizations.of(context)!.calendarEventGlobalTitleCreate
              : AppLocalizations.of(context)!.calendarEventGlobalTitleUpdate,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        Visibility(
          visible: widget.eventData == null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(multiEventSelection
                  ? AppLocalizations.of(context)!.calendarEventWeeklyEvent
                  : AppLocalizations.of(context)!.calendarEventIndividualEvent),
              Row(
                children: [
                  Switch(
                    value: multiEventSelection,
                    onChanged: (value) {
                      widget.onMultiEventSelection(value);
                      setState(() {
                        multiEventSelection = value;
                      });
                    },
                  ),
                  Visibility(
                    visible: multiEventSelection,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        initialValue: numberOfWeeks.toString(),
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!
                                .calendarEventFormNumberOfWeeks),
                        validator: (value) {
                          if (int.parse(value ?? "0") == 0) {
                            return AppLocalizations.of(context)!
                                .calendarEventFormErrorInvalidNumberOfWeeks;
                          }
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!
                                .errorEmptyField;
                          }
                          return null;
                        },
                        onChanged: (value) {
                          widget.onSelectedWeeks(
                            int.parse(value),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
