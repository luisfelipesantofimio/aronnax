import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:flutter/material.dart';

class CaseOutcomeVisualizationDialog extends StatelessWidget {
  const CaseOutcomeVisualizationDialog({
    super.key,
    required this.caseData,
  });
  final PatientCase caseData;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.patientCaseSeeCaseOutcomeTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    AppMethods().getTreatmentPlanOutcomeIcon(
                        caseData.treatmentPlanOutcome!),
                    color: AppMethods().getTreatmentPlanOutcomeColor(
                        caseData.treatmentPlanOutcome!),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Text(
                    caseData.treatmentPlanOutcome!
                            .substring(0, 1)
                            .toUpperCase() +
                        caseData.treatmentPlanOutcome!.substring(1),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppMethods().getTreatmentPlanOutcomeColor(
                          caseData.treatmentPlanOutcome!),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Visibility(
                visible: caseData.treatmentPlanOutcomeExplanation != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .patientCaseDataOutcomeDialogTitle,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(caseData.treatmentPlanOutcomeExplanation ?? '')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
