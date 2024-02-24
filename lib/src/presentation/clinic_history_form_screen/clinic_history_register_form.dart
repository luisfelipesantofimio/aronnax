import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/forms_providers/clinic_history_form_provider.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClinicHistoryRegisterForm extends ConsumerStatefulWidget {
  const ClinicHistoryRegisterForm({super.key});

  @override
  ConsumerState<ClinicHistoryRegisterForm> createState() =>
      _ClinicHistoryRegisterFormState();
}

class _ClinicHistoryRegisterFormState
    extends ConsumerState<ClinicHistoryRegisterForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          key: clinicHistoryKey,
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
                        .clinicHistoryFormMentalExamination,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (value) {
                    ref
                        .read(clinicHistoryMentalExaminationProvider.notifier)
                        .update(
                          (state) => value,
                        );
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
                        .clinicHistoryFormPsyAntecedents,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (value) {
                    ref
                        .read(clinicHistoryPsyAntecedentsProvider.notifier)
                        .update(
                          (state) => value,
                        );
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
                        .clinicHistoryFormMedAntecedents,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (value) {
                    ref
                        .read(clinicHistoryMedAntecedentsProvider.notifier)
                        .update(
                          (state) => value,
                        );
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
                  maxLines: 10,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!
                        .clinicHistoryFormPersonalHistory,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (value) {
                    ref
                        .read(clinicHistoryPersonalHistoryProvider.notifier)
                        .update(
                          (state) => value,
                        );
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
                  maxLines: 10,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!
                        .clinicHistoryFormFamilyHistory,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (value) {
                    ref
                        .read(clinicHistoryFamilyHistoryProvider.notifier)
                        .update(
                          (state) => value,
                        );
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
        ),
      ],
    );
  }
}
