import 'package:aronnax/src/Pages/Formulary/widgets/consultant_selection_dialog.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SessionInformationView extends ConsumerWidget {
  const SessionInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Fecha de la sesión:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          DateFormat('dd/MM/yyyy').format(
            DateTime.now(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        const Text(
          'Sesión realizada por:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
            "${ref.read(globalUserNameProvider)} ${ref.read(globalUserLastNameProvider)}"),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        const Text(
          'Consultante:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          ref.read(globalSelectedConsultantNamesProvider),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        const Text(
          'Fecha de creación:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          DateFormat('dd/MM/yyyy').format(DateTime.now()),
        ),
      ],
    );
  }
}
