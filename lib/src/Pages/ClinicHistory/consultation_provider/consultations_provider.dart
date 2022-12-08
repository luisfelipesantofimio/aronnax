import 'dart:developer';

import 'package:aronnax/src/API/server_api.dart';
import 'package:aronnax/src/database/models/remote_clinic_history.dart';
import 'package:aronnax/src/database/models/remote_patient.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalPatientConsultationState
    extends StateNotifier<List<RemotePatient>> {
  GlobalPatientConsultationState() : super([]);
  List<RemotePatient> currentSearchedPatients = [];
  List<RemotePatient> stateSnapshot = [];
  var db = MySQL();
  getPatientInfo() {
    db.getConnection().then((conn) {
      String queryPatientData = 'SELECT * FROM patients';

      conn.query(queryPatientData).then((results) {
        for (var element in results) {
          state.add(
            RemotePatient.fromJson(element.fields),
          );
        }
      });
    });
    stateSnapshot = state;
  }

  void localQuery(String data) {
    state = stateSnapshot;
    currentSearchedPatients.clear();
    for (var element in state) {
      if (element.names.toLowerCase().startsWith(data) ||
          element.names.toLowerCase().contains(data)) {
        currentSearchedPatients.add(element);
      }
    }
    state = currentSearchedPatients;
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
