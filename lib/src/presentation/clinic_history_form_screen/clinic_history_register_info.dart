import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ClinicHistoryRegisterInformation extends ConsumerWidget {
  const ClinicHistoryRegisterInformation({
    super.key,
    required this.patientName,
    required this.registerCode,
  });

  final String patientName;
  final String registerCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.clinicHistoryInfoPatientName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(patientName),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        Text(
          AppLocalizations.of(context)!.clinicHistoryInfoRecordCode,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(registerCode),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        Text(
          AppLocalizations.of(context)!.clinicHistoryInfoProfessionalName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          "${ref.read(globalUserInformationProvider)!.names} ${ref.read(globalUserInformationProvider)!.lastNames}",
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        Text(
          AppLocalizations.of(context)!.clinicHistoryInfoCreationDate,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          DateFormat('dd/MM/yyyy').format(DateTime.now()),
        ),
      ],
    );
  }
}
