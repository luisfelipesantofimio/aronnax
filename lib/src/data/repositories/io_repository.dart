import 'dart:convert';
import 'dart:io';

import 'package:aronnax/src/data/interfaces/io_repository_interface.dart';
import 'package:aronnax/src/domain/entities/metadata.dart';
import 'package:aronnax/src/domain/entities/professional.dart';
import 'package:encrypt/encrypt.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class IoRepository implements IoRepositoryInterface {
  @override
  Future<File> exportToTextFile(
      {required String fileName,
      required String contents,
      required Professional professionalData}) async {
    final documentsPath = await getApplicationDocumentsDirectory();
    final path = Directory('${documentsPath.path}/aronnax_exports/');

    final hydrated =
        FileMetadata(professionalData: professionalData, encodedData: contents)
            .toJsonString();
    if (!await path.exists()) {
      await path.create();
    }
    final File file = File(
      p.join(documentsPath.path, 'aronnax_exports/$fileName.arnx'),
    );
    return file.writeAsBytes(utf8.encode(hydrated));
  }

  @override
  Future<String> readFromTextFile(String pathToFile, bool privateFile) async {
    File file = File(pathToFile);
    final decoded = utf8.decode(file.readAsBytesSync());
    if (privateFile) {
      file.delete();
    }
    return decoded;
  }

  @override
  Future<File> decryptFile(
      {required String encryptedFilePath,
      required String encryptionKey}) async {
    try {
      final key = Key.fromUtf8(encryptionKey);
      final iv = IV.fromLength(16); //TODO: Validate better IV
      final encrypter = Encrypter(AES(key));
      final encryptedFile = File(encryptedFilePath);
      final decryptedContents = encrypter
          .decryptBytes(Encrypted(encryptedFile.readAsBytesSync()), iv: iv);

      final decryptedFile =
          File(encryptedFilePath.replaceAll('.encrypted', ''));
      await decryptedFile.writeAsBytes(decryptedContents);

      return decryptedFile;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void encryptFile({required File input, required String encryptionKey}) async {
    final encryptedFile = File('${input.path}.encrypted');

    final key = Key.fromUtf8(encryptionKey);
    final iv = IV.fromLength(16); //TODO: Validate better IV

    final encrypter = Encrypter(AES(key));

    final encryptedBytes =
        encrypter.encryptBytes(input.readAsBytesSync(), iv: iv).bytes;

    encryptedFile.writeAsBytesSync(encryptedBytes);
    await input.delete();
  }
}
