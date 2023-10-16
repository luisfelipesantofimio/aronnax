import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventDateTimeSelection extends StatefulWidget {
  const EventDateTimeSelection({
    super.key,
    required this.onSelectedDate,
    required this.onSelectedTime,
  });
  final void Function(DateTime? date) onSelectedDate;
  final void Function(TimeOfDay? time) onSelectedTime;

  @override
  State<EventDateTimeSelection> createState() => _EventDateTimeSelectionState();
}

class _EventDateTimeSelectionState extends State<EventDateTimeSelection> {
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedHour = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.calendarEventFormDate,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMd(AppLocalizations.of(context)!.localeName).format(
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
                widget.onSelectedDate(selectedDate);

                setState(() {});
              },
              child: Text(
                AppLocalizations.of(context)!.genericSelectTitle,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Text(
          AppLocalizations.of(context)!.calendarEventFormTime,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
                widget.onSelectedTime(selectedHour);
                setState(() {});
              },
              child: Text(
                AppLocalizations.of(context)!.genericSelectTitle,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
