import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/presentation/widgets/consultation_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalSelectedConsultantNamesProvider =
    StateProvider<String>((ref) => '');
final globalSelectedConsultantIDProvider = StateProvider<int>((ref) => 0);

class ConsultantSelectionDialog extends ConsumerStatefulWidget {
  const ConsultantSelectionDialog({
    super.key,
    required this.title,
    required this.onSearchedPatient,
  });
  final String title;

  final Function(Patient patient) onSearchedPatient;

  @override
  ConsultantSelectionDialogState createState() =>
      ConsultantSelectionDialogState();
}

class ConsultantSelectionDialogState
    extends ConsumerState<ConsultantSelectionDialog> {
  String dataForQuery = "";
  List<Patient> queriedPatients = [];
  @override
  Widget build(BuildContext context) {
    final patientsList = ref.watch(
      patientsListProvider,
    );

    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 186, 230, 230),
      content: patientsList.when(
        data: (data) => SizedBox(
          width: 700,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText:
                        AppLocalizations.of(context)!.genericPatientNameTitle),
                onChanged: (value) {
                  setState(() {
                    queriedPatients = ref
                        .read(patientsRepositoryProvider)
                        .queryPatients(data, value);
                    dataForQuery = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Visibility(
                visible: dataForQuery != "",
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: queriedPatients.length,
                    itemBuilder: (context, index) {
                      return ConsultationMenuElement(
                        name:
                            "${queriedPatients.map((e) => e.names).toList()[index]} ${queriedPatients.map((e) => e.lastNames).toList()[index]}",
                        idNumber: queriedPatients
                            .map((e) => e.idNumber)
                            .toList()[index]
                            .toString(),
                        onTap: () async {
                          widget.onSearchedPatient(
                            queriedPatients[index],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        error: (error, stackTrace) =>
            Text(AppLocalizations.of(context)!.genericErrorMessage),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
