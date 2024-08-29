import 'dart:convert';

import 'package:aronnax/src/data/interfaces/update_detection_interface.dart';
import 'package:aronnax/src/domain/entities/update_data.dart';
import 'package:aronnax/src/presentation/core/constants.dart';
import 'package:dio/dio.dart';

class UpdateDetectionRepository implements UpdateDetectionInterface {
  @override
  Future<UpdateData?> checkForUpdate() async {
    Dio dio = Dio();

    final response = await dio.get(AppConstants.githubEndpoint,
        options: Options(headers: {
          "Authorization": "Bearer ${AppConstants.githubToken}",
          "Accept": "Accept: application/vnd.github+json",
          "X-GitHub-Api-Version": AppConstants.githubApiVersion
        }));

    if (response.statusCode == 200) {
      final data = response.data[0] as Map<String, dynamic>;

      final tag = data["tag_name"] as String;
      final formattedRemoteVersion =
          int.parse(tag.replaceAll("v", "").split(".").join(""));
      final formatedBuildVersion = int.parse(
          AppConstants.globalVersion.replaceAll("v", "").split(".").join(""));
      final newVersion = tag != AppConstants.globalVersion &&
          formattedRemoteVersion > formatedBuildVersion;
      if (newVersion) {
        return UpdateData(content: data["body"], version: tag);
      } else {
        return null;
      }
    } else {
      throw "Something went wrong! ${response.data}";
    }
  }
}
