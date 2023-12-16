import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/appointments_provider.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventStatusSelector extends ConsumerStatefulWidget {
  const EventStatusSelector({
    super.key,
    required this.onColorSelected,
  });

  final Function(Color color) onColorSelected;

  @override
  ConsumerState<EventStatusSelector> createState() =>
      _EventStatusSelectorState();
}

class _EventStatusSelectorState extends ConsumerState<EventStatusSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.calendarEventStatusTitle),
          RadioListTile(
            title: Text(
                AppLocalizations.of(context)!.calendarEventStatusScheduled),
            value: CalendarEventStates.scheduled,
            groupValue: ref.watch(appointmentStatusProvider),
            onChanged: (CalendarEventStates? value) {
              ref.read(appointmentStatusProvider.notifier).update(
                    (state) => value,
                  );
            },
          ),
          RadioListTile(
            title: Text(AppLocalizations.of(context)!.calendarEventStatusDone),
            value: CalendarEventStates.done,
            groupValue: ref.watch(appointmentStatusProvider),
            onChanged: (CalendarEventStates? value) {
              ref.read(appointmentStatusProvider.notifier).update(
                    (state) => value,
                  );
            },
          ),
          RadioListTile(
            title:
                Text(AppLocalizations.of(context)!.calendarEventStatusCanceled),
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
          Text(AppLocalizations.of(context)!.calendarEventTypeTitle),
          RadioListTile(
            title: Text(AppLocalizations.of(context)!.calendarEventTypeMeeting),
            value: CalendarEventType.meeting,
            groupValue: ref.watch(appointmentTypeProvider),
            onChanged: (CalendarEventType? value) {
              ref
                  .read(appointmentTypeProvider.notifier)
                  .update((state) => value);
              widget.onColorSelected(const Color.fromARGB(255, 232, 219, 181));
            },
          ),
          RadioListTile(
            title: Text(
                AppLocalizations.of(context)!.calendarEventTypeConsultation),
            value: CalendarEventType.consultation,
            groupValue: ref.watch(appointmentTypeProvider),
            onChanged: (CalendarEventType? value) {
              ref
                  .read(appointmentTypeProvider.notifier)
                  .update((state) => value);
              widget.onColorSelected(const Color.fromARGB(255, 138, 194, 227));
            },
          ),
          RadioListTile(
            title:
                Text(AppLocalizations.of(context)!.calendarEventTypeFollowUp),
            value: CalendarEventType.following,
            groupValue: ref.watch(appointmentTypeProvider),
            onChanged: (CalendarEventType? value) {
              ref
                  .read(appointmentTypeProvider.notifier)
                  .update((state) => value);
              widget.onColorSelected(
                const Color.fromARGB(255, 153, 221, 190),
              );
            },
          ),
        ],
      ),
    );
  }
}
