import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/patient_case_providers.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CaseDeleteDialog extends ConsumerWidget {
  const CaseDeleteDialog({
    super.key,
    required this.caseData,
  });
  final PatientCase caseData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.3,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppLocalizations.of(context)!.patientCaseDeleteDialogTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  SizedBox(
                      width: constraints.maxWidth * 0.6,
                      child: Text(
                        AppLocalizations.of(context)!
                            .patientCaseDeleteDialogDescription,
                        textAlign: TextAlign.center,
                      )),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.6,
                    child: GenericMinimalButton(
                      title: AppLocalizations.of(context)!.genericDelete,
                      onTap: () {
                        ref
                            .read(patientsRepositoryProvider)
                            .deletePatientCase(ref, caseData.id);
                        ref.invalidate(patientCaseListProvider);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(AppLocalizations.of(context)!
                                .patientCaseDeleteDialogDeleteConfirmation),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
