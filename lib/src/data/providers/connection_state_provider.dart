
import 'package:aronnax/main.dart';
import 'package:aronnax/src/data/database/settings_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalOfflineStatus extends StateNotifier<bool> {
  GlobalOfflineStatus() : super(false);

  LocalDatabaseMode currentLocalDBstatus = offlineModeDB.get("offlineModeDB");

  void updateCurrentStatus() {
    state = !state;
    offlineModeDB.put(
      "offlineModeDB",
      LocalDatabaseMode(state),
    );
  }

  void setCurrentStatus() {
    if (offlineModeDB.isNotEmpty) {
      state = currentLocalDBstatus.offlineModeEnabled;
    }
  }
}

final globalOfflineStatusProvider =
    StateNotifierProvider<GlobalOfflineStatus, bool>(
  (ref) => GlobalOfflineStatus(),
);
