import 'dart:convert';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:aronnax/src/presentation/core/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

String scope = 'icdapi_access';

String grantType = 'client_credentials';

class Api {
  Dio dio = Dio();

  Future<String> getIcdAuthToken({
    required String clientId,
    required String clientSecret,
    required String scope,
    required String grantType,
  }) async {
    const endpoint = "https://icdaccessmanagement.who.int/connect/token";

    Map<String, String> body = {
      'client_id': clientId,
      'client_secret': clientSecret,
      'scope': scope,
      'grant_type': grantType
    };

    FormData bodyAsFormData = FormData.fromMap(body);

    final request = await dio.post(
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

  Future<String> getIcdEntity(
    String token,
    String language,
    String entity,
  ) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Accept-Language': language,
      'API-Version': 'v2'
    };

    final request = await dio.get(
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

  Future<IcdDataCategory> parseIcdEntity(String entity, String token) async {
    final data = await getIcdEntity(token, "es", entity);

    return IcdDataCategory.fromJson(data);
  }
}

Future<List<IcdDataChild>> getIcdGroups(
    String token, String language, String entity) async {
  List<IcdDataChild> children = [];

  IcdDataChild data =
      IcdDataChild.fromJson(await Api().getIcdEntity(token, language, entity));

  for (var element in data.child!) {
    children.add(
      IcdDataChild.fromJson(
        await Api().getIcdEntity(
          token,
          language,
          element.toString().replaceAll('http', 'https'),
        ),
      ),
    );
  }
  return children;
}

final icdDataProvider = FutureProvider.family<List<IcdDataParser>, String>(
  (ref, entity) async {
    List<IcdDataParser> entitiesList = [];
    String token = await Api().getIcdAuthToken(
        clientId: AppConstants.clientId,
        clientSecret: AppConstants.clientSecret,
        scope: scope,
        grantType: grantType);
    final parent = await getIcdGroups(token, 'es', entity);
    final icdReleaseData = jsonDecode(
      await Api().getIcdEntity(
          token, 'es', 'https://id.who.int/icd/release/11/2023-01/mms'),
    );

    for (var element in parent) {
      IcdDataParser newGroupData = IcdDataParser(
        title: element.title,
        icdRelease: icdReleaseData['releaseId'],
        definition: element.definition,
        child: [],
      );

      for (var element in element.child ?? []) {
        newGroupData.child.add(
          IcdDataCategory.fromJson(
            await Api().getIcdEntity(
              token,
              'es',
              element.toString().replaceAll('http', 'https'),
            ),
          ),
        );
      }
      ref.read(localDatabaseRepositoryProvider).insertIcdData(newGroupData);
    }

    return entitiesList;
  },
);

final savedIcdDiagnosticDataProvider =
    FutureProvider.autoDispose<List<IcdDataParser>>((ref) async {
  final sourcesList =
      await ref.read(localDatabaseRepositoryProvider).getDiagnosticData();

  return sourcesList.map((e) {
    final encodedCategoryData = jsonDecode(e.categoryData) as List;
    List<IcdDataCategory> categoriesList = encodedCategoryData
        .map((e) => IcdDataCategory.fromLocalModel(e))
        .toList();
    return IcdDataParser(
      title: e.title,
      definition: e.definition,
      icdRelease: e.icdRelease,
      child: categoriesList,
    );
  }).toList();
});

final icdDiagnosticCategoriesListProvider =
    FutureProvider.autoDispose<List<IcdDataCategory>>((ref) async {
  List<IcdDataCategory> categoriesList = [];
  final sourcesList =
      await ref.read(localDatabaseRepositoryProvider).getDiagnosticData();

  List<IcdDataParser> sourceData = sourcesList.map((e) {
    final encodedCategoryData = jsonDecode(e.categoryData) as List;
    List<IcdDataCategory> categoriesList = encodedCategoryData
        .map((e) => IcdDataCategory.fromLocalModel(e))
        .toList();
    return IcdDataParser(
      title: e.title,
      definition: e.definition,
      icdRelease: e.icdRelease,
      child: categoriesList,
    );
  }).toList();
  for (var source in sourceData) {
    for (var element in source.child) {
      categoriesList.add(element);
    }
  }
  return categoriesList;
});
