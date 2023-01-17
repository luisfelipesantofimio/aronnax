import 'package:aronnax/main.dart';
import 'package:aronnax/src/data/database/settings_db/settings.dart';

class DatabaseRepository {
  Future<bool> isSettingsDBEmpty() async {
    final settings = await isar.settings.get(0);

    return settings == null;
  }

  Future<bool?> isAronnaxConfigured() async {
    final settings = isar.collection<Settings>();
    Settings? currentSettings = await settings.get(0);
    return currentSettings!.isConfigured;
  }
}
