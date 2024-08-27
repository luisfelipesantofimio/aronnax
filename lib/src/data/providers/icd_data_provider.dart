import 'package:aronnax/src/data/interfaces/icd_repository_interface.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Returns the localized ICD data from the json file
final icdDataProvider =
    FutureProvider.family<List<IcdData>, String>((ref, language) {
  return ref.read(icdRepositoryProvider).getIcdCategoriesFromObject(language);
});
