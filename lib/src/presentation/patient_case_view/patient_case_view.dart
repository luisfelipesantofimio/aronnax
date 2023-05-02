import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/presentation/patient_case_view/clinic_history_detail_view.dart';
import 'package:aronnax/src/presentation/patient_case_view/patient_cases_list.dart';
import 'package:aronnax/src/presentation/patient_case_view/patient_treatmentplan_results.dart';
import 'package:flutter/material.dart';

class PatientCaseView extends StatelessWidget {
  const PatientCaseView({Key? key, required this.patiendData})
      : super(key: key);
  final Patient patiendData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back))
              ],
            ),
          ),
          Column(
            children: [
              const Text(
                'Clinic history',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width * 0.4,
                child: ClinicHistoryDetailView(
                  patientData: patiendData,
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.4,
                child: PatientCasesListView(
                  patientData: patiendData,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.4,
                child: PatientTreatmentPlanResultsView(
                  patientId: patiendData.id,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
