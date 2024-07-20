import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/forms_providers/session_form_provider.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionsForm extends ConsumerStatefulWidget {
  const SessionsForm(
      {super.key, required this.patientData, required this.sessionFormKey});
  final GlobalKey<FormState> sessionFormKey;
  final Patient patientData;

  @override
  SessionsFormState createState() => SessionsFormState();
}

class SessionsFormState extends ConsumerState<SessionsForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          key: widget.sessionFormKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!
                        .sessionFormFieldSessionSummary,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valResume) {
                    ref
                        .read(sessionSummaryProvider.notifier)
                        .update((state) => valResume);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!
                        .sessionFormFieldSessionGoal,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valObjective) {
                    ref
                        .read(sessionObjectivesProvider.notifier)
                        .update((state) => valObjective);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 5,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!
                        .sessionFormFieldTherapeuticArchievements,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valArchievement) {
                    ref
                        .read(sessionTherapeuticArchievementsProvider.notifier)
                        .update((state) => valArchievement);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
