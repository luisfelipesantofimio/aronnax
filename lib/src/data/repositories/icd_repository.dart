import 'dart:convert';

import 'package:aronnax/src/data/interfaces/icd_repository_interface.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:dio/dio.dart';

class IcdRepository implements IcdRepositoryInteface {
  @override
  Future<String> getIcdAuthToken(
      {required String clientId, required String clientSecret}) async {
    const endpoint = "https://icdaccessmanagement.who.int/connect/token";
    String scope = 'icdapi_access';

    String grantType = 'client_credentials';

    Map<String, String> body = {
      'client_id': clientId,
      'client_secret': clientSecret,
      'scope': scope,
      'grant_type': grantType
    };

    FormData bodyAsFormData = FormData.fromMap(body);

    final request = await Dio().post(
      endpoint,
      data: bodyAsFormData,
    );

    if (request.statusCode == 200) {
      final body = request.data;
      return body["access_token"];
    } else {
      final response = request.data;
      return "error ${response['error']}";
    }
  }

  @override
  Future<String> getIcdEntity(
      String token, String language, String entity) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Accept-Language': language,
      'API-Version': 'v2'
    };

    final request = await Dio().get(
      entity,
      options: Options(headers: headers),
    );

    if (request.statusCode == 200) {
      final encodedData = jsonEncode(request.data);

      return encodedData;
    } else {
      return "Error: ${request.data}";
    }
  }

  @override
  Future<List<IcdDataChild>> getIcdGroups(
      String token, String language, String entity) async {
    List<IcdDataChild> children = [];

    IcdDataChild data =
        IcdDataChild.fromJson(await getIcdEntity(token, language, entity));

    for (var element in data.child!) {
      children.add(
        IcdDataChild.fromJson(
          await getIcdEntity(
            token,
            language,
            element.toString().replaceAll('http', 'https'),
          ),
        ),
      );
    }
    return children;
  }

  @override
  Future<IcdDataCategory> parseIcdEntity(String entity, String token) async {
    final data = await getIcdEntity(token, "es", entity);

    return IcdDataCategory.fromJson(data);
  }
}
