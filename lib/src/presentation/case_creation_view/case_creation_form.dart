import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:aronnax/src/presentation/case_creation_view/case_diagnosic_dialog.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CaseCreationForm extends ConsumerStatefulWidget {
  const CaseCreationForm({super.key});

  @override
  ConsumerState<CaseCreationForm> createState() => _CaseCreationFormState();
}

class _CaseCreationFormState extends ConsumerState<CaseCreationForm> {
  IcdData? selectedIcdCategory;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Form(
        key: caseCreationFormKey,
        child: Column(
          children: [
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!
                    .caseCreationFormHintConsultationReason,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!.errorEmptyField;
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
                  hintText: AppLocalizations.of(context)!
                      .caseCreationFormTitleDiagnostic,
                  suffix: IconButton(
                    tooltip:
                        AppLocalizations.of(context)!.caseDiagnosticSearchTerm,
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
                  return AppLocalizations.of(context)!.genericErrorMessage;
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .caseCreationFormTitleSelectedDiagnostic,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.5,
                      child: Text(
                          '${selectedIcdCategory == null ? '' : selectedIcdCategory!.title} (${selectedIcdCategory == null ? '' : selectedIcdCategory!.code})'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(caseFormDiagnosticCodeProvider.notifier)
                            .update(
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
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!
                      .caseCreationFormTitleTreatmentProposotion),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!.errorEmptyField;
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
    });
  }
}
