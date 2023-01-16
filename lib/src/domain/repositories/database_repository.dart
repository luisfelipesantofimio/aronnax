import 'package:aronnax/main.dart';
import 'package:aronnax/src/data/database/settings_db/settings.dart';

class DatabaseRepository {
  Future<bool> isSettingsDBEmpty() async {
    List<Settings> settingsList = [];
    final settings = isar.collection<Settings>();
    Settings? currentSettings = await settings.get(0);
    settingsList.add(currentSettings!);
    return settingsList.isEmpty;
  }

  Future<bool?> isAronnaxConfigured() async {
    final settings = isar.collection<Settings>();
    Settings? currentSettings = await settings.get(0);
    return currentSettings!.isConfigured;
  }

  Future<bool?> getCurrentThemeMode() async {
    final db = isar.collection<Settings>();
    final darkTheme = await db.get(0);
    return darkTheme!.isDarkModeEnabled;
  }
}
