import 'package:aronnax/src/data/interfaces/update_detection_interface.dart';
import 'package:aronnax/src/domain/entities/update_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Global provider used for update banner display until the user dismisses it
final displayUpdateAnoucement = StateProvider<bool>(
  (ref) => true,
);

final updateDataProvider = FutureProvider<UpdateData?>(
  (ref) => ref.read(updateDetectionProvider).checkForUpdate(),
);
