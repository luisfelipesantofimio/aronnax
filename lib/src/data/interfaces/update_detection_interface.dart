import 'package:aronnax/src/data/repositories/update_detection_repository.dart';
import 'package:aronnax/src/domain/entities/update_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UpdateDetectionInterface {
  /// Checks for an update using the latest Github release
  Future<UpdateData?> checkForUpdate();
}

final updateDetectionProvider = Provider<UpdateDetectionInterface>(
  (ref) => UpdateDetectionRepository(),
);
