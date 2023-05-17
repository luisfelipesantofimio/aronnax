import 'dart:io';

import 'package:aronnax/src/data/interfaces/io_repository_interface.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class IoRepository implements IoRepositoryInterface {
  @override
  Future<File> exportToTextFile(
      {required String fileName, required String contents}) async {
    final documentsPath = await getApplicationDocumentsDirectory();
    final path = Directory('${documentsPath.path}/aronnax_exports/');
    if (!await path.exists()) {
      await path.create();
    }
    final File file = File(
      p.join(documentsPath.path, 'aronnax_exports/$fileName.arnx'),
    );
    return file.writeAsString(contents);
  }

  @override
  Future<String> readFromTextFile(String pathToFile) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['arnx'],
    );
    File file = File(result!.files.single.path!);
    return await file.readAsString();
  }
}
