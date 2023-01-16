import 'package:aronnax/main.dart';
import 'package:aronnax/src/data/database/settings_db/settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalOfflineStatus extends StateNotifier<bool> {
  GlobalOfflineStatus() : super(false);

  final settings = isar.settings;

  void getConnectionStatus() async {
    Settings? currentSettings = await settings.get(0);
    state = currentSettings!.isOfflineModeEnabled!;
  }

  void updateCurrentStatus() async {
    Settings? currentSettings = await settings.get(0);
    currentSettings!.isDarkModeEnabled = !currentSettings.isDarkModeEnabled!;
    settings.put(currentSettings);
  }
}

final globalOfflineStatusProvider =
    StateNotifierProvider<GlobalOfflineStatus, bool>(
  (ref) => GlobalOfflineStatus(),
);
