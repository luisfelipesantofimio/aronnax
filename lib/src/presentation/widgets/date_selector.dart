import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({
    Key? key,
    required this.date,
    required this.onChanged,
  }) : super(key: key);
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Fecha de nacimiento:",
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
              DateFormat("dd/MM/yyyy").format(widget.date),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        TextButton(
          onPressed: () async {
            var newDate = await showDatePicker(
                context: context,
                initialDate: widget.date,
                firstDate: DateTime(1900),
                lastDate: DateTime(3000),
                cancelText: "Cancelar",
                fieldHintText: "día/mes/año",
                confirmText: "Confirmar",
                fieldLabelText: "Fecha",
                //fieldHintText: "Seleccionar fecha",
                helpText: "Seleccionar fecha");
            if (newDate == null) {
              return;
            }
            widget.onChanged(newDate);
          },
          child: Text(
            "Editar",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
