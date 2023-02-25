import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ClinicHistoryRegisterInformation extends ConsumerWidget {
  const ClinicHistoryRegisterInformation({
    Key? key,
    required this.patientName,
    required this.registerCode,
  }) : super(key: key);

  final String patientName;
  final String registerCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Consultante:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(patientName),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        const Text(
          'Código único de la historia clínica',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(registerCode),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        const Text(
          'Profesional',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          "${ref.read(globalUserInformationProvider)!.names} ${ref.read(globalUserInformationProvider)!.lastNames}",
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        const Text(
          'Fecha de creación',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          DateFormat('dd/MM/yyyy').format(DateTime.now()),
        ),
      ],
    );
  }
}
