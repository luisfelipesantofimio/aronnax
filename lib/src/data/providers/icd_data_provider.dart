import 'dart:convert';
import 'package:aronnax/src/data/interfaces/icd_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:aronnax/src/presentation/core/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final icdDataProvider = FutureProvider.family<List<IcdDataParser>, String>(
  (ref, entity) async {
    List<IcdDataParser> entitiesList = [];
    String token = await ref.read(IcdRepositoryProvider).getIcdAuthToken(
          clientId: AppConstants.clientId,
          clientSecret: AppConstants.clientSecret,
        );
    final parent =
        await ref.read(IcdRepositoryProvider).getIcdGroups(token, 'es', entity);
    final icdReleaseData = jsonDecode(
      await ref.read(IcdRepositoryProvider).getIcdEntity(
          token, 'es', 'https://id.who.int/icd/release/11/2023-01/mms'),
    );

    for (var element in parent) {
      IcdDataParser newGroupData = IcdDataParser(
        title: element.title,
        icdRelease: icdReleaseData['releaseId'],
        definition: element.definition,
        child: [],
      );

      for (var element1 in element.child ?? []) {
        IcdDataCategory newElement = IcdDataCategory.fromJson(
          await ref.read(IcdRepositoryProvider).getIcdEntity(
                token,
                'es',
                element1.toString().replaceAll('http', 'https'),
              ),
        );

        newGroupData.child.add(
          newElement.copyWith(
            groupName: element.title,
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
