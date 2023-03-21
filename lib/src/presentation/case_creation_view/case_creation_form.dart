import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CaseCreationForm extends ConsumerWidget {
  const CaseCreationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: caseCreationFormKey,
      child: Column(
        children: [
          TextFormField(
            maxLines: 3,
            decoration: const InputDecoration(hintText: 'Motivo de consulta'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'El campo no puede estar vacío';
              }
              return null;
            },
            onChanged: (value) {
              ref
                  .read(caseFormConsultationReasonProvider.notifier)
                  .update((state) => value);
            },
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          TextFormField(
            maxLines: 3,
            decoration: const InputDecoration(hintText: 'Diagnóstico'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'El campo no puede estar vacío';
              }
              return null;
            },
            onChanged: (value) {
              ref
                  .read(caseFormDiagnosticProvider.notifier)
                  .update((state) => value);
            },
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          TextFormField(
            maxLines: 3,
            decoration:
                const InputDecoration(hintText: 'Propuesta de tratamiento'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'El campo no puede estar vacío';
              }
              return null;
            },
            onChanged: (value) {
              ref
                  .read(caseFormTreatmentProposalProvider.notifier)
                  .update((state) => value);
            },
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          TextFormField(
            maxLines: 3,
            decoration: const InputDecoration(hintText: 'Notas'),
            onChanged: (value) {
              ref
                  .read(caseFormCaseNotesProvider.notifier)
                  .update((state) => value);
            },
          ),
        ],
      ),
    );
  }
}
