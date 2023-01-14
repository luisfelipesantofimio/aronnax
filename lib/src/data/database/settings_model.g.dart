// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServerSettingsAdapter extends TypeAdapter<ServerSettings> {
  @override
  final int typeId = 0;

  @override
  ServerSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServerSettings(
      fields[0] as String,
      fields[1] as String,
      fields[5] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ServerSettings obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.server)
      ..writeByte(3)
      ..write(obj.port)
      ..writeByte(4)
      ..write(obj.isConfigured)
      ..writeByte(5)
      ..write(obj.databaseName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GlobalThemeModeAdapter extends TypeAdapter<GlobalThemeMode> {
  @override
  final int typeId = 1;

  @override
  GlobalThemeMode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GlobalThemeMode(
      fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, GlobalThemeMode obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.darkModeEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalThemeModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocalDatabaseModeAdapter extends TypeAdapter<LocalDatabaseMode> {
  @override
  final int typeId = 2;

  @override
  LocalDatabaseMode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalDatabaseMode(
      fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LocalDatabaseMode obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.offlineModeEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalDatabaseModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
