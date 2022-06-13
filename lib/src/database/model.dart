import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class ServerSettings extends HiveObject {
  @HiveField(0)
  String userName;

  @HiveField(1)
  String password;

  @HiveField(2)
  String server;

  @HiveField(3)
  String port;

  @HiveField(4)
  bool isConfigured;

  @HiveField(5)
  String databaseName;

  ServerSettings(this.userName, this.password, this.databaseName, this.server,
      this.port, this.isConfigured);
}

@HiveType(typeId: 1)
class LocalSettings extends HiveObject {
  @HiveField(0)
  bool darkModeEnabled = false;

  LocalSettings(this.darkModeEnabled);
}
