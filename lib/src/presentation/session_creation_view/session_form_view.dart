import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/forms_providers/session_form_provider.dart';
import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/presentation/treatment_plans/treatment_plan_application/treatment_plan_application_view.dart';
import 'package:aronnax/src/presentation/widgets/note_creation_dialog.dart';
import 'package:aronnax/src/presentation/session_creation_view/session_form.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/session_creation_view/session_information_view.dart';
import 'package:aronnax/src/presentation/widgets/generic_global_button.dart';
import 'package:aronnax/src/presentation/widgets/generic_icon_button.dart';
import 'package:aronnax/src/presentation/widgets/session_performance_dialog/session_performance_dialog.dart';
import 'package:aronnax/src/presentation/widgets/todo_creation_dialog/todos_creation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SessionFormView extends ConsumerStatefulWidget {
  const SessionFormView({
    Key? key,
    required this.patientData,
    required this.patientCaseData,
    required this.patientSessionAmount,
  }) : super(key: key);
  final Patient patientData;
  final PatientCase patientCaseData;
  final int patientSessionAmount;

  @override
  ConsumerState<SessionFormView> createState() => _SessionFormViewState();
}

class _SessionFormViewState extends ConsumerState<SessionFormView> {
  bool treatmentPlanResultsSaved = false;

  @override
  void initState() {
    Future(() {
      ref.read(sessionSummaryProvider.notifier).update((state) => '');
      ref.read(sessionObjectivesProvider.notifier).update((state) => '');
      ref
          .read(sessionTherapeuticArchievementsProvider.notifier)
          .update((state) => '');
      ref.read(sessionNotesProvider.notifier).update((state) => null);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final treatmentPlan = ref.watch(
        treatmentPlanListProvider(ref.read(offlineStatusProvider).value!));
    final screenWidth = MediaQuery.of(context).size.width;

    final cellWidth = MediaQuery.of(context).size.width * 0.3;
    final crossAxisCount = (screenWidth / cellWidth).floor();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 166, 211, 227),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.2,
                        child: SessionInformationView(
                            patientData: widget.patientData),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.2,
                        child: GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 4 / 4,
                            crossAxisCount: crossAxisCount,
                          ),
                          children: [
                            GenericIconButton(
                              icon: FontAwesomeIcons.noteSticky,
                              title: AppLocalizations.of(context)!
                                  .sessionFormAddNote,
                              onTap: () => showDialog(
                                context: context,
                                builder: (context) =>
                                    const NoteCreationDialog(),
                              ),
                            ),
                            GenericIconButton(
                              icon: FontAwesomeIcons.squareCheck,
                              title:
                                  AppLocalizations.of(context)!.sessionFormTask,
                              onTap: () => showDialog(
                                context: context,
                                builder: (context) =>
                                    const TodosCreationDialog(),
                              ),
                            ),
                            GenericIconButton(
                              icon: FontAwesomeIcons.microscope,
                              title: AppLocalizations.of(context)!
                                  .sessionFormStartTest,
                              onTap: () =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(AppLocalizations.of(context)!
                                      .sessionFormStartTestSoon),
                                ),
                              ),
                            ),
                            treatmentPlan.when(
                              data: (data) => Visibility(
                                visible:
                                    widget.patientCaseData.treatmentPlanId !=
                                        null,
                                child: GenericIconButton(
                                  icon: FontAwesomeIcons.handHoldingMedical,
                                  title: AppLocalizations.of(context)!
                                      .sessionFormBeginTreatmentPlan,
                                  onTap: () => treatmentPlanResultsSaved
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(AppLocalizations.of(
                                                    context)!
                                                .sessionFormBeginTreatmentPlanTaken),
                                          ),
                                        )
                                      : showDialog(
                                          context: context,
                                          builder: (context) =>
                                              TreatmentPlanApplicationView(
                                            patientSessionAmount:
                                                widget.patientSessionAmount,
                                            caseData: widget.patientCaseData,
                                            treatmentPlanData: data.elementAt(
                                              data.indexWhere((element) =>
                                                  element.id ==
                                                  widget.patientCaseData
                                                      .treatmentPlanId),
                                            ),
                                            onResultsSaving: (resultsSaved) {
                                              setState(() {
                                                treatmentPlanResultsSaved =
                                                    true;
                                              });
                                            },
                                          ),
                                        ),
                                ),
                              ),
                              error: (error, stackTrace) => Text(
                                  AppLocalizations.of(context)!
                                      .genericErrorMessage),
                              loading: () => const CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            AppLocalizations.of(context)!.sessionFormNewSession,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width * 0.75,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                15,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 20,
                                    ),
                                    child: SessionsForm(
                                      patientData: widget.patientData,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.arrow_back),
                                      tooltip: AppLocalizations.of(context)!
                                          .registerBackButtonTitle,
                                    ),
                                    const Padding(padding: EdgeInsets.all(10)),
                                    GenericGlobalButton(
                                      height: 40,
                                      width: 200,
                                      title: AppLocalizations.of(context)!
                                          .sessionFormSaveSession,
                                      onPressed: () {
                                        if (sessionFormKey.currentState!
                                            .validate()) {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                SessionPerformanceDialog(
                                                    patientCaseData:
                                                        widget.patientCaseData,
                                                    patientData:
                                                        widget.patientData),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
