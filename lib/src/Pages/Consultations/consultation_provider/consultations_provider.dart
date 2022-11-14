import 'dart:developer';

import 'package:aronnax/src/API/server_api.dart';
import 'package:aronnax/src/Pages/Consultations/clinic_history_consultation/clinic_history_data.dart';
import 'package:aronnax/src/database/models/remote_clinic_history.dart';
import 'package:aronnax/src/database/models/remote_patient.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';

class GlobalPatientConsultationState
    extends StateNotifier<List<RemotePatient>> {
  GlobalPatientConsultationState() : super([]);
  var db = MySQL();
  getPatientInfo(String data) {
    //  state.clear();
    db.getConnection().then((conn) {
      String queryPatientData =
          'SELECT * FROM patients WHERE names LIKE "%$data%"';

      conn.query(queryPatientData).then((results) {
        for (var element in results) {
          state.add(
            RemotePatient.fromJson(element.fields),
          );
        }
      });
    });
    log(state.length.toString());
    log(state.toString());
  }

  cleanCurrentList() {
    state.clear();
  }
}

class GlobalClinicHistoryConsultationState
    extends StateNotifier<List<RemoteClinicHistory>> {
  GlobalClinicHistoryConsultationState() : super([]);
  var db = MySQL();
  getPatientInfo(int data) {
    db.getConnection().then((conn) {
      String queryClinicHistoryData =
          'SELECT * FROM clinic_history WHERE idNumber = $data';

      conn.query(queryClinicHistoryData).then((results) {
        state.add(
          RemoteClinicHistory.fromJson(
            results.single.fields,
          ),
        );
      });
      currentDate.value = state.single.dateTime;
      log(currentDate.value = state.single.dateTime);
      // currentRegister.value =
      //     searchedClinicHistoryData[index]
      //         .registerCode;
      // currentConsultationReason.value =
      //     searchedClinicHistoryData[index]
      //         .consultationReason;
      // currentMentalExamn.value =
      //     searchedClinicHistoryData[index]
      //         .mentalExamn;
      // currentDiagnostic.value =
      //     searchedClinicHistoryData[index].diagnostic;
      // currentFamilyHistory.value =
      //     searchedClinicHistoryData[index]
      //         .familyHistory;
      // currentPersonalHistory.value =
      //     searchedClinicHistoryData[index]
      //         .personalHistory;
      // currentPsyAntecedents.value =
      //     searchedClinicHistoryData[index]
      //         .psyAntecedents;
      // currentMedAntecedents.value =
      //     searchedClinicHistoryData[index]
      //         .medAntecedents;
      // creator.value =
      //     searchedClinicHistoryData[index].createdBy;
    });
  }

  cleanCurrentClinicHistoryList() {
    state.clear();
  }
}

final globalQueriedPatientProvider =
    StateNotifierProvider<GlobalPatientConsultationState, List<RemotePatient>>(
  (ref) => GlobalPatientConsultationState(),
);

final globalQueriedClinicHistoryProvider = StateNotifierProvider<
    GlobalClinicHistoryConsultationState, List<RemoteClinicHistory>>(
  (ref) => GlobalClinicHistoryConsultationState(),
);
