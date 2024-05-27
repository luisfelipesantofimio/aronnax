import 'package:aronnax/src/data/interfaces/telemetry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedbackProvider = FutureProvider.autoDispose(
  (ref) => ref.read(telemetryRepositoryProvider).getExistingFeedback(),
);
