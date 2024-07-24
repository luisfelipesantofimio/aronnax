import 'dart:convert';

import 'package:aronnax/src/domain/entities/professional.dart';

/// Simple abstraction for better file metadata injection on data export
class FileMetadata {
  final int arnxVersion = 1;
  final Professional professionalData;
  final DateTime creation = DateTime.now();
  final String encodedData;

  FileMetadata({
    required this.professionalData,
    required this.encodedData,
  });

  Map<String, dynamic> toJson() {
    return {
      'arnxVersion': arnxVersion,
      'data': encodedData,
      'professional': professionalData.toJson(),
      'creation': creation.toIso8601String(),
    };
  }

  String toJsonString() => json.encode(toJson());
}
