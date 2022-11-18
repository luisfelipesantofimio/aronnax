import 'dart:developer';

import 'package:aronnax/src/API/server_api.dart';
import 'package:aronnax/src/database/models/remote_clinic_history.dart';
import 'package:aronnax/src/database/models/remote_patient.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          "SELECT * FROM clinic_history WHERE idNumber = $data";

      conn.query(queryClinicHistoryData).then((results) {
        state.add(
          RemoteClinicHistory.fromJson(
            results.first.fields,
          ),
        );
      });
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
