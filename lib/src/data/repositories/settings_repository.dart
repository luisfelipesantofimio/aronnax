import 'package:aronnax/src/data/interfaces/settings_repository_interface.dart';

class SettingsRepository implements SettingsRepositoryInterface {
  @override
  void switchConnectionMode() {
    // TODO: implement switchConnectionMode
  }

  @override
  void switchCurrentTheme() {
    // TODO: implement switchCurrentTheme
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
