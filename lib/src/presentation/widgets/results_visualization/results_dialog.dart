import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/presentation/patient_case_view/patient_treatmentplan_results.dart';
import 'package:flutter/material.dart';

class ResultsDialog extends StatelessWidget {
  const ResultsDialog(
      {Key? key, required this.patientId, required this.caseData})
      : super(key: key);
  final int patientId;
  final PatientCase caseData;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Treatment plan results',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Expanded(
                child: PatientTreatmentPlanResultsView(
                  patientId: patientId,
                  caseData: caseData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
