import 'package:aronnax/src/data/database/local_model/tables.dart';
import 'package:aronnax/src/domain/entities/companion_reason.dart';
import 'package:aronnax/src/domain/entities/companion_relationship.dart';
import 'package:aronnax/src/presentation/widgets/date_selector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:flutter/material.dart';

class CompanionForm extends StatefulWidget {
  const CompanionForm(
      {super.key,
      required this.onCompanionName,
      required this.onCompanionLastName,
      required this.onCompanionEmail,
      required this.onCompanionPhone,
      required this.onCompanionIdentification,
      required this.onCompanionDateTime,
      required this.onCompanionRelationship,
      required this.onCompanionReason});
  final void Function(String value) onCompanionName;
  final void Function(String value) onCompanionLastName;
  final void Function(String value) onCompanionEmail;
  final void Function(String value) onCompanionPhone;
  final void Function(String value) onCompanionIdentification;
  final void Function(DateTime value) onCompanionDateTime;
  final void Function(CompanionRelationship value) onCompanionRelationship;
  final void Function(CompanionReason reason) onCompanionReason;

  @override
  State<CompanionForm> createState() => _CompanionFormState();
}

class _CompanionFormState extends State<CompanionForm> {
  List<CompanionRelationshipModel> relationships = [];
  List<CompanionReasonModel> companionReasons = [];
  @override
  void didChangeDependencies() {
    setState(() {
      relationships = CompanionRelationshipModel.getLocalizedValues(context);
      companionReasons = CompanionReasonModel.getLocalizedValues(context);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context)!.registerFormNamesField,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.errorEmptyField;
                  }
                  return null;
                },
                onChanged: (value) {
                  widget.onCompanionName(value);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context)!.registerFormLastNamesField,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.errorEmptyField;
                  }
                  return null;
                },
                onChanged: (value) {
                  widget.onCompanionLastName(value);
                },
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context)!.registerFormEmailField,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                validator: (value) {
                  if (value!.isNotEmpty && !AppMethods().validateEmail(value)) {
                    return AppLocalizations.of(context)!.registerFormErrorEmail;
                  }
                  return null;
                },
                onChanged: (value) {
                  widget.onCompanionEmail(value);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!
                      .registerFormContactNumberField,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                onChanged: (value) {
                  widget.onCompanionPhone(value);
                },
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!
                      .registerFormIdentificationNumberField,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                onChanged: (value) {
                  widget.onCompanionIdentification(value);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            DateSelector(
              date: DateTime.now(),
              onChanged: (value) {
                widget.onCompanionDateTime(value);
              },
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context)!.patientCompanionRelation,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                items: relationships
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.value,
                        child: Text(
                          e.name,
                        ),
                      ),
                    )
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return AppLocalizations.of(context)!
                        .patientCaseCloseDialogCloseNoOptionError;
                  }
                  return null;
                },
                onChanged: (value) {
                  widget.onCompanionRelationship(value!);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context)!.patientCompanionReason,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                items: companionReasons
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.value,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return AppLocalizations.of(context)!
                        .patientCaseCloseDialogCloseNoOptionError;
                  }
                  return null;
                },
                onChanged: (value) {
                  widget.onCompanionReason(value!);
                },
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
      ],
    );
  }
}
