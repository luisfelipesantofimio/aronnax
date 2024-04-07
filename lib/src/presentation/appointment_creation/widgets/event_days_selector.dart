import 'package:aronnax/src/data/interfaces/calendar_repository_interface.dart';
import 'package:aronnax/src/data/providers/appointments_provider.dart';
import 'package:aronnax/src/presentation/widgets/calendar_components/multi_event_delete_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventDaysSelector extends ConsumerStatefulWidget {
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
  ConsumerState<EventDaysSelector> createState() => _EventDaysSelectorState();
}

class _EventDaysSelectorState extends ConsumerState<EventDaysSelector> {
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
          visible:
              widget.eventData != null && widget.eventData!.groupId != null,
          child: TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return MultiEventDeleteDialog(onDelete: () async {
                      try {
                        final result = await ref
                            .read(calendarRepositoryProvider)
                            .deleteEventGroup(
                              ref: ref,
                              groupId: widget.eventData?.groupId ?? '',
                            );
                        ref.invalidate(appointmentsGlobalListProvider);
                        Future(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '$result ${AppLocalizations.of(context)!.calendarEventMultideleteDialogDeleteConfirmation}',
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        });
                      } catch (e) {
                        Future(() {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                '${AppLocalizations.of(context)!.genericErrorMessage}: ${e.toString()}'),
                          ));
                        });
                      }
                    });
                  });
            },
            child: Text(
                AppLocalizations.of(context)!.calendarEventMultideleteTitle),
          ),
        ),
        Visibility(
          visible: widget.eventData == null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
