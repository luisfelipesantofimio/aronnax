import 'package:aronnax/main.dart';
import 'package:aronnax/src/data/database/settings_db/settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsNotifier extends StateNotifier<Settings?> {
  SettingsNotifier() : super(Settings());

  void getData(int id) async {
    state = await isar.settings.get(id);
  }
}
