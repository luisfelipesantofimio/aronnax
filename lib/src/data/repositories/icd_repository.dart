import 'dart:convert';
import 'dart:io';

import 'package:aronnax/src/data/interfaces/icd_repository_interface.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:flutter/services.dart';

class IcdRepository implements IcdRepositoryInteface {
  @override
  Future<List<IcdData>> getIcdCategoriesFromObject(String language) async {
    try {
      final asset = await rootBundle
          .loadString('assets/icd_data/icd_data_$language.json');

      final Map<String, dynamic> decoded = jsonDecode(asset);

      return IcdData.fromJson(decoded).children;
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<IcdData> filterIcdCategories({
    required List<IcdData> data,
    required String query,
  }) {
    return data
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
