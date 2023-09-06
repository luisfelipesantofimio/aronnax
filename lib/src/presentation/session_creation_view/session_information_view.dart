import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SessionInformationView extends ConsumerWidget {
  const SessionInformationView({Key? key, required this.patientData})
      : super(key: key);
  final Patient patientData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.sessionInformationDateTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          DateFormat('dd/MM/yyyy').format(
            DateTime.now(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        Text(
          AppLocalizations.of(context)!.sessionInformationPatientTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text("${patientData.names} ${patientData.lastNames}"),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
      ],
    );
  }
}
