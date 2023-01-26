import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsStreamProvider = StreamProvider.autoDispose<Setting>((ref) {
  return ref.watch(localDatabaseRepositoryProvider).getSettingsAsStream();
});
