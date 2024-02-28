import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/patient_case_providers.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CaseCloseDialog extends ConsumerStatefulWidget {
  const CaseCloseDialog({
    super.key,
    required this.caseData,
  });
  final PatientCase caseData;

  @override
  ConsumerState<CaseCloseDialog> createState() => _CaseCloseDialogState();
}

class _CaseCloseDialogState extends ConsumerState<CaseCloseDialog> {
  List<String> outcomeOptions = ['negative', 'neutral', 'positive'];
  String? selectedCaseOutcome;
  String? outcomeDescription;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context)!.patientCaseCloseDialogTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                AppLocalizations.of(context)!.patientCaseCloseDialogDescription,
              ),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: outcomeOptions.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: outcomeOptions[index],
                            groupValue: selectedCaseOutcome,
                            onChanged: (value) {
                              setState(() {
                                selectedCaseOutcome = outcomeOptions[index];
                              });
                            },
                          ),
                          Text(
                            outcomeOptions[index],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!
                      .patientCaseCloseDialogOptionalOutcome,
                ),
                onChanged: (value) {
                  setState(() {
                    outcomeDescription = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              GenericMinimalButton(
                title: AppLocalizations.of(context)!
                    .patientCaseCloseDialogCloseButton,
                onTap: () {
                  if (selectedCaseOutcome != null) {
                    ref
                        .read(patientsRepositoryProvider)
                        .closeCurrentPatientCase(ref, widget.caseData.id,
                            selectedCaseOutcome!, outcomeDescription);
                    ref.invalidate(patientCaseListProvider);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Case closed'),
                      ),
                    );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(AppLocalizations.of(context)!
                            .patientCaseCloseDialogCloseNoOptionError),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
