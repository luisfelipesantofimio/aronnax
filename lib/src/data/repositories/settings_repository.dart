import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/settings_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsRepository implements SettingsRepositoryInterface {
  @override
  void switchConnectionMode() {
    // TODO: implement switchConnectionMode
  }

  @override
  void switchCurrentTheme(WidgetRef ref, bool isDarkThemeEnabled) {
    ref
        .read(localDatabaseRepositoryProvider)
        .updateThemeMode(isDarkThemeEnabled);
  }

  @override
  Future<void> updateLocalUserPassword(String newEncodedValue) {
    // TODO: implement updateLocalUserPassword
    throw UnimplementedError();
  }

  @override
  Future<void> updateRemoteUserPassword(String newEncodedValue) {
    // TODO: implement updateRemoteUserPassword
    throw UnimplementedError();
  }
}
