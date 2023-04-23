import 'dart:developer';

import 'package:aronnax/src/data/providers/icd_data_provider.dart';
import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:aronnax/src/presentation/case_creation_view/case_diagnosic_dialog.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CaseCreationForm extends ConsumerStatefulWidget {
  const CaseCreationForm({Key? key}) : super(key: key);

  @override
  ConsumerState<CaseCreationForm> createState() => _CaseCreationFormState();
}

class _CaseCreationFormState extends ConsumerState<CaseCreationForm> {
  IcdDataCategory? selectedIcdCategory;
  @override
  Widget build(BuildContext context) {
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
            decoration: InputDecoration(
                hintText: 'Diagnóstico',
                suffix: IconButton(
                  tooltip: 'Buscar código CIE',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CaseDiagnosticDialog(
                          onSelectedCategory: (data) {
                            selectedIcdCategory = data;
                            ref
                                .read(caseFormDiagnosticCodeProvider.notifier)
                                .update(
                                  (state) => data.code,
                                );
                            setState(() {});
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                  ),
                )),
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
          Visibility(
            visible: selectedIcdCategory != null,
            child: Row(
              children: [
                const Text(
                  'Diagnóstico seleccionado: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    '${selectedIcdCategory == null ? '' : selectedIcdCategory!.title} (${selectedIcdCategory == null ? '' : selectedIcdCategory!.code})'),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(caseFormDiagnosticCodeProvider.notifier).update(
                          (state) => null,
                        );
                    setState(() {
                      selectedIcdCategory = null;
                    });
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trashCan,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
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
