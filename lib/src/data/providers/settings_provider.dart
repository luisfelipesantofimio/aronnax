import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Settings stream provider
final settingsStreamProvider = StreamProvider<Setting>((ref) {
  return ref.watch(localDatabaseRepositoryProvider).getSettingsAsStream();
});

/// Settings future provider
final settingsProvider = FutureProvider<Setting>((ref) {
  return ref.read(localDatabaseRepositoryProvider).getLocalSettings();
});
