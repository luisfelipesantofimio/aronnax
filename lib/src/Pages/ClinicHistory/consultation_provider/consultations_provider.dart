import 'dart:developer';

import 'package:aronnax/src/API/server_api.dart';
import 'package:aronnax/src/database/local_model/local_model.dart';
import 'package:aronnax/src/database/local_model/local_queries.dart';
import 'package:aronnax/src/database/models/remode_session_resume.dart';
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

  List<RemoteClinicHistory> currentSearchedClinicHistory = [];
  List<RemoteClinicHistory> stateSnapshot = [];

  var db = MySQL();
  getPatientInfo() {
    db.getConnection().then((conn) {
      String queryClinicHistoryData = "SELECT * FROM clinic_history";

      conn.query(queryClinicHistoryData).then((results) {
        for (var element in results) {
          state.add(
            RemoteClinicHistory.fromJson(
              element.fields,
            ),
          );
        }
      });
    });

    stateSnapshot = state;
  }

  clinicHistoryQuery(int idNumber) {
    state = stateSnapshot;
    currentSearchedClinicHistory.clear();

    for (var element in state) {
      if (element.idNumber == idNumber) {
        currentSearchedClinicHistory.add(element);
        log("Historia encontrada: ${element.idNumber}");
      }
    }
    state = currentSearchedClinicHistory;
  }

  cleanCurrentClinicHistoryList() {
    state.clear();
  }
}

class GlobalRemoteSessionsState extends StateNotifier<List<RemoteSession>> {
  GlobalRemoteSessionsState() : super([]);
  var db = MySQL();
  List<RemoteSession> stateSnapshot = [];
  List<RemoteSession> currentSearchedSessions = [];
  fetchCurrentSessionData() {
    db.getConnection().then((conn) {
      String queryClinicHistoryData = "SELECT * FROM sessions";

      conn.query(queryClinicHistoryData).then((results) {
        for (var element in results) {
          state.add(
            RemoteSession.fromJson(
              element.fields,
            ),
          );
        }
      });
    });
    stateSnapshot = state;
  }

  searchPatientSessions(int idNumber) {
    state = stateSnapshot;
    currentSearchedSessions.clear();

    for (var element in state) {
      if (element.idNumber == idNumber) {
        currentSearchedSessions.add(element);
      }
    }
    state = currentSearchedSessions;
  }

  cleanCurrentSessionData() {
    state.clear();
  }
}

class LocalSessionsState extends StateNotifier<List<Session>> {
  LocalSessionsState() : super([]);

  List<Session> currentSearchedSessions = [];

  Future<void> searchLocalSessions(int idNumber) async {
    state = await localDB.sessionsConsultation(idNumber);
  }

  cleanCurrentSessionData() {
    state.clear();
  }
}

class LocalClinicHistoryConsultationState
    extends StateNotifier<List<ClinicHistoryData>> {
  LocalClinicHistoryConsultationState() : super([]);

  List<ClinicHistoryData> currentSearchedClinicHistory = [];

  Future<void> searchLocalClinicHistory(int idNumber) async {
    state = await localDB.clinicHistoryConsultation(idNumber);
    log("Dato de la historia clínica con cc $idNumber: ${state.first.createdBy}");
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

final globalQueriedSessionsProvider =
    StateNotifierProvider<GlobalRemoteSessionsState, List<RemoteSession>>(
  (ref) => GlobalRemoteSessionsState(),
);

final localQueriedSessionsProvider =
    StateNotifierProvider<LocalSessionsState, List<Session>>(
  (ref) => LocalSessionsState(),
);

final localQueriedClinicHistoryProvider = StateNotifierProvider<
    LocalClinicHistoryConsultationState, List<ClinicHistoryData>>(
  (ref) => LocalClinicHistoryConsultationState(),
);
