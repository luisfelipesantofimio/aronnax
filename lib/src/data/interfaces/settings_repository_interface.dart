import 'package:aronnax/src/data/repositories/settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class SettingsRepositoryInterface {
  void switchCurrentTheme(WidgetRef ref, bool isDarkThemeEnabled);
  void switchConnectionMode();
  Future<void> updateRemoteUserPassword(String newEncodedValue);
  Future<void> updateLocalUserPassword(String newEncodedValue);
}

final settingsRepositoryProvider = Provider<SettingsRepositoryInterface>(
  (ref) => SettingsRepository(),
);
