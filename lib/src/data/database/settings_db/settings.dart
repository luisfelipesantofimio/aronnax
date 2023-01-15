import 'package:isar/isar.dart';

part "settings.g.dart";

@collection
class Settings {
  Id id = Isar.autoIncrement;
  bool? isDarkModeEnabled;
  bool? isOfflineModeEnabled;
  bool? isConfigured;
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
