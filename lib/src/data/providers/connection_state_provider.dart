import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalOfflineStatus extends StateNotifier<bool> {
  GlobalOfflineStatus() : super(false);

  // void getConnectionStatus() async {
  //   state = currentSettings!.isOfflineModeEnabled!;
  // }

  // void updateCurrentStatus() async {
  //   Settings? currentSettings = await settings.get(0);
  //   currentSettings!.isDarkModeEnabled = !currentSettings.isDarkModeEnabled!;
  //   settings.put(currentSettings);
  // }
}

final offlineStatusProvider = FutureProvider<bool>((ref) async {
  Setting settings =
      await ref.watch(localDatabaseRepositoryProvider).getLocalSettings();
  return settings.isOfflineModeEnabled;
});

final globalOfflineStatusProvider =
    StateNotifierProvider<GlobalOfflineStatus, bool>(
  (ref) => GlobalOfflineStatus(),
);
