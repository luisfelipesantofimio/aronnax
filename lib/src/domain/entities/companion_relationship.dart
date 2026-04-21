import 'package:aronnax/l10n/app_localizations.dart';
import 'package:aronnax/src/data/database/local_model/tables.dart';
import 'package:flutter/material.dart';

class CompanionRelationshipModel {
  CompanionRelationship value;
  String name;
  CompanionRelationshipModel({required this.value, required this.name});

  static List<CompanionRelationshipModel> getLocalizedValues(
      BuildContext context) {
    return [
      CompanionRelationshipModel(
          value: CompanionRelationship.friend,
          name: AppLocalizations.of(context)!.friend),
      CompanionRelationshipModel(
          value: CompanionRelationship.parent,
          name: AppLocalizations.of(context)!.parent),
      CompanionRelationshipModel(
          value: CompanionRelationship.other,
          name: AppLocalizations.of(context)!.other),
      CompanionRelationshipModel(
          value: CompanionRelationship.partner,
          name: AppLocalizations.of(context)!.partner),
      CompanionRelationshipModel(
        value: CompanionRelationship.relative,
        name: AppLocalizations.of(context)!.relative,
      ),
    ];
  }
}
