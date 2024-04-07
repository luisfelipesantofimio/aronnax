import 'package:aronnax/src/data/database/local_model/tables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///Represents the reason of the companion and provides an open String name and
///the [CompanionReason] value
class CompanionReasonModel {
  final String name;
  final CompanionReason value;
  const CompanionReasonModel({required this.name, required this.value});

  static List<CompanionReasonModel> getLocalizedValues(BuildContext context) {
    return [
      CompanionReasonModel(
          value: CompanionReason.disabled,
          name: AppLocalizations.of(context)!.disabled),
      CompanionReasonModel(
          value: CompanionReason.underage,
          name: AppLocalizations.of(context)!.underage),
      CompanionReasonModel(
          value: CompanionReason.other,
          name: AppLocalizations.of(context)!.other),
    ];
  }
}
