import 'dart:developer';

import 'package:aronnax/src/API/server_api.dart';
import 'package:aronnax/src/database/local_model/local_model.dart';
import 'package:aronnax/src/database/local_model/local_queries.dart';
import 'package:aronnax/src/database/models/remote_professional.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalRemoteLoginState extends StateNotifier<List<RemoteProfessional>> {
  GlobalRemoteLoginState() : super([]);
  var db = MySQL();
  void getProfessionalsInServer() {
    state.clear();
    db.getConnection().then((conn) {
      String loginQuery = "select * from professional";

      conn.query(loginQuery).then((result) {
        for (var element in result) {
          state.add(
            RemoteProfessional.fromJson(element.fields),
          );
        }
      });
    });
  }
}

final remoteLoginStateProvider =
    StateNotifierProvider<GlobalRemoteLoginState, List<RemoteProfessional>>(
  (ref) => GlobalRemoteLoginState(),
);

final localLoginStateProvider =
    StreamProvider.family<List<ProfessionalData>, int>(
  (ref, userID) => localDB.loginProfessional(userID),
);
