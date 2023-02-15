import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final offlineStatusProvider = FutureProvider<bool>((ref) async {
  Setting settings =
      await ref.watch(localDatabaseRepositoryProvider).getLocalSettings();
  return settings.isOfflineModeEnabled;
});

final globalOfflineStatusProvider = StateProvider((ref) => false);
