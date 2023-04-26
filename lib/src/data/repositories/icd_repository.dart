import 'dart:convert';

import 'package:aronnax/src/data/interfaces/icd_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      options: Options(
        receiveTimeout: const Duration(minutes: 2),
        headers: headers,
      ),
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

    if (data.child != null) {
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
    }
    return children;
  }

  @override
  Future<IcdDataCategory> parseIcdEntity(String entity, String token) async {
    final data = await getIcdEntity(token, "es", entity);

    return IcdDataCategory.fromJson(data);
  }

  @override
  Future<List<IcdDataParser>> getIcdDataParser(
    Ref ref,
    String entity,
    String clientId,
    String clientSecret,
  ) async {
    List<IcdDataParser> entitiesList = [];
    String token =
        await getIcdAuthToken(clientId: clientId, clientSecret: clientSecret);

    final icdGroupsList = await getIcdGroups(token, 'es', entity);
    final icdReleaseData = jsonDecode(
      await ref.read(IcdRepositoryProvider).getIcdEntity(
          token, 'es', 'https://id.who.int/icd/release/11/2023-01/mms'),
    );

    for (var groupElement in icdGroupsList) {
      IcdDataParser newGroupData = IcdDataParser(
        title: groupElement.title,
        icdRelease: icdReleaseData['releaseId'],
        definition: groupElement.definition,
        child: [],
      );

      for (var subGroupElement in groupElement.child ?? []) {
        IcdDataCategory newElement = IcdDataCategory.fromJson(
          await ref.read(IcdRepositoryProvider).getIcdEntity(
                token,
                'es',
                subGroupElement.toString().replaceAll('http', 'https'),
              ),
        );

        newGroupData.child.add(
          newElement.copyWith(
            groupName: groupElement.title,
          ),
        );
        final nestedParent = await getIcdGroups(
          token,
          'es',
          subGroupElement.toString().replaceAll('http', 'https'),
        );
        for (var element1 in nestedParent) {
          if (element1.child != null) {
            final results = await Future.wait(element1.child!.map((e) async {
              IcdDataCategory newElement = IcdDataCategory.fromJson(
                await ref.read(IcdRepositoryProvider).getIcdEntity(
                      token,
                      'es',
                      e.toString().replaceAll('http', 'https'),
                    ),
              );
              return newElement;
            }));
            newGroupData.child.addAll(results);
          }

          for (var element2 in element1.child ?? []) {
            IcdDataCategory newElement = IcdDataCategory.fromJson(
              await ref.read(IcdRepositoryProvider).getIcdEntity(
                    token,
                    'es',
                    element2.toString().replaceAll('http', 'https'),
                  ),
            );

            newGroupData.child.add(
              newElement.copyWith(
                groupName: groupElement.title,
              ),
            );
            final nestedParent = await getIcdGroups(
              token,
              'es',
              element2.toString().replaceAll('http', 'https'),
            );

            for (var element in nestedParent) {
              if (element.child != null) {
                final results = await Future.wait(element.child!.map((e) async {
                  IcdDataCategory newElement = IcdDataCategory.fromJson(
                    await ref.read(IcdRepositoryProvider).getIcdEntity(
                          token,
                          'es',
                          e.toString().replaceAll('http', 'https'),
                        ),
                  );
                  return newElement;
                }));
                newGroupData.child.addAll(results);
              }
            }
          }
        }
      }
      ref.read(localDatabaseRepositoryProvider).insertIcdData(newGroupData);
    }

    return entitiesList;
  }
}
