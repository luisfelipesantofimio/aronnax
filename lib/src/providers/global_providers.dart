import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalOfflineStatus extends StateNotifier<bool> {
  GlobalOfflineStatus() : super(false);
  void updateCurrentStatus() {
    state = !state;
  }
}

final globalOfflineStatusProvider =
    StateNotifierProvider<GlobalOfflineStatus, bool>(
  (ref) => GlobalOfflineStatus(),
);
