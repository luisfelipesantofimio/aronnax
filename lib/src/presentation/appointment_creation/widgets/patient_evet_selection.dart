import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientEventSelection extends ConsumerWidget {
  const PatientEventSelection({
    super.key,
    required this.eventData,
    required this.onSelectedPatient,
  });
  final CalendarEvent? eventData;
  final void Function(Patient? patient) onSelectedPatient;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientsList = ref.watch(patientsListProvider);

    return SizedBox(
      width: 250,
      child: patientsList.when(
        data: (data) => DropdownButtonFormField(
          validator: (value) {
            if (value == null) {
              return AppLocalizations.of(context)!
                  .calendarEventFormErrorNoPatientSelected;
            }
            return null;
          },
          hint: Text(AppLocalizations.of(context)!.genericPatientTitle),
          isExpanded: true,
          items: data
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text('${e.names} ${e.lastNames}'),
                ),
              )
              .toList(),
          value: eventData != null
              ? data.elementAt(
                  data.indexWhere(
                      (element) => element.id == eventData!.patientID),
                )
              : null,
          onChanged: (Patient? value) {
            onSelectedPatient(value);
          },
        ),
        error: (error, stackTrace) =>
            Text(AppLocalizations.of(context)!.genericErrorMessage),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
