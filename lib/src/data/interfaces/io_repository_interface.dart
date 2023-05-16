import 'dart:io';

import 'package:aronnax/src/data/repositories/io_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IoRepositoryInterface {
  Future<File> exportToTextFile(
      {required String fileName, required String contents});
  Future<String> readFromTextFile(String pathToFile);
}

final ioRepositoryProvider = Provider<IoRepositoryInterface>(
  (ref) => IoRepository(),
);
