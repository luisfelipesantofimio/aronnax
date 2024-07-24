import 'dart:io';

import 'package:aronnax/src/data/repositories/io_repository.dart';
import 'package:aronnax/src/domain/entities/professional.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IoRepositoryInterface {
  Future<File> exportToTextFile(
      {required String fileName,
      required String contents,
      required Professional professionalData});
  Future<String> readFromTextFile(String pathToFile, bool privateFile);
  void encryptFile({
    required File input,
    required String encryptionKey,
  });
  Future<File> decryptFile({
    required String encryptedFilePath,
    required String encryptionKey,
  });
}

final ioRepositoryProvider = Provider<IoRepositoryInterface>(
  (ref) => IoRepository(),
);
