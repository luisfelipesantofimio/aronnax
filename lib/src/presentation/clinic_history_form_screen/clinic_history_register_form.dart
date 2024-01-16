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
                    labelText: "Examen mental",
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
                      return "Inserta un valor";
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
                    labelText: "Antecedentes psicológicos",
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
                      return "Inserta un valor";
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
                    labelText: "Antecedentes médicos",
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
                      return "Inserta un valor";
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
                    labelText: "Historia personal",
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
                      return "Inserta un valor";
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
                    labelText: "Historia familiar",
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
                      return "Inserta un valor";
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
