import 'package:aronnax/src/data/repositories/icd_repository.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IcdRepositoryInteface {
  ///Returns the required user token for the ICD api service
  Future<String> getIcdAuthToken({
    required String clientId,
    required String clientSecret,
  });

  ///Returns the raw json body for the required endpoint entry point
  Future<String> getIcdEntity(
    String token,
    String language,
    String entity,
  );

  ///Get the list of strings containing the next endpoints to parse
  Future<List<IcdDataChild>> getIcdGroups(
      String token, String language, String entity);

  ///Transforms the raw json and parse it as [IcdDataCategory]
  Future<IcdDataCategory> parseIcdEntity(String entity, String token);

  ///Returns the required parsed data type for local ICD data management
  Future<List<IcdDataParser>> getIcdDataParser(
    Ref ref,
    String entity,
    String clientId,
    String clientSecret,
  );
}

final IcdRepositoryProvider = Provider<IcdRepositoryInteface>(
  (ref) => IcdRepository(),
);
