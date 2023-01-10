import 'package:isar/isar.dart';

part "settings.g.dart";

@collection
class Settings {
  Id id = 0;
  bool isDarkModeEnabled = false;
  bool isOfflineModeEnabled = false;
}

@collection
class RemoteDatabaseAccess {
  Id id = Isar.autoIncrement;

  String? userName;

  String? password;

  String? server;

  String? port;

  String? databaseName;
}
