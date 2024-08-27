import 'package:aronnax/src/data/repositories/icd_repository.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IcdRepositoryInteface {
  Future<List<IcdData>> getIcdCategoriesFromObject(String language);
  List<IcdData> filterIcdCategories(
      {required List<IcdData> data, required String query});
}

/// Provider for [IcdRepositoryInteface]
final icdRepositoryProvider = Provider<IcdRepositoryInteface>(
  (ref) => IcdRepository(),
);
