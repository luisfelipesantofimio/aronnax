import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/database/local_model/local_queries.dart';
import 'package:aronnax/src/data/providers/forms_providers/session_form_provider.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/main_menu/main_menu.dart';
import 'package:aronnax/src/presentation/widgets/generic_global_button.dart';
import 'package:aronnax/src/presentation/widgets/session_performance_dialog/session_performance_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SessionPerformanceDialog extends ConsumerStatefulWidget {
  const SessionPerformanceDialog({
    super.key,
    required this.patientData,
    required this.patientCaseData,
  });
  final Patient patientData;
  final PatientCase patientCaseData;

  @override
  ConsumerState<SessionPerformanceDialog> createState() =>
      _SessionPerformanceDialogState();
}

class _SessionPerformanceDialogState
    extends ConsumerState<SessionPerformanceDialog> {
  int? selectedItem;
  String? performanceExplanation;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 400,
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.sessionReportDialogTitle,
                      style: Theme.of(context).textTheme.headlineSmall),
                  Text(
                      "${AppLocalizations.of(context)!.sessionReportDialogDescription}:"),
                  const Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SessionPerformanceElement(
                        icon: FontAwesomeIcons.faceSadTear,
                        title: AppLocalizations.of(context)!
                            .sessionReportDialogBadOption,
                        performance: 0,
                        isSelected: selectedItem == 0,
                        onTap: () {
                          setState(() {
                            selectedItem = 0;
                          });
                        },
                      ),
                      SessionPerformanceElement(
                        icon: FontAwesomeIcons.faceMeh,
                        title: AppLocalizations.of(context)!
                            .sessionReportDialogNormalOption,
                        performance: 1,
                        isSelected: selectedItem == 1,
                        onTap: () {
                          setState(() {
                            selectedItem = 1;
                          });
                        },
                      ),
                      SessionPerformanceElement(
                        icon: FontAwesomeIcons.faceSmileBeam,
                        title: AppLocalizations.of(context)!
                            .sessionReportDialogGoodOption,
                        performance: 2,
                        isSelected: selectedItem == 2,
                        onTap: () {
                          setState(() {
                            selectedItem = 2;
                          });
                        },
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Visibility(
                    visible: selectedItem != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!
                            .sessionReportDialogDescription),
                        TextField(
                          onChanged: (value) => setState(() {
                            performanceExplanation = value;
                          }),
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!
                                  .sessionReportDialogPerformanceExplanationHintText),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  GenericGlobalButton(
                    height: 40,
                    width: 200,
                    title: AppLocalizations.of(context)!.continueButton,
                    onPressed: () {
                      if (selectedItem != null) {
                        // isOfflineEnabled
                        //     ?
                        ref
                            .read(localDatabaseRepositoryProvider)
                            .addLocalSession(
                              sessionSummary: ref.read(sessionSummaryProvider),
                              sessionObjectives:
                                  ref.read(sessionObjectivesProvider),
                              therapeuticArchievements: ref.read(
                                  sessionTherapeuticArchievementsProvider),
                              idNumber: widget.patientData.id,
                              professionalID:
                                  ref.read(globalUserInformationProvider)!.id,
                              sessionDate: DateTime.now(),
                              caseId: widget.patientCaseData.id,
                              sessionNotes: ref.read(sessionNotesProvider),
                              sessionPerformance: selectedItem!,
                              sessionPerformanceExplanation:
                                  performanceExplanation ?? "",
                            );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainMenu(),
                          ),
                        );
                        // : insertSessionData(
                        //     DateTime.now(),
                        //     ref.read(sessionSummaryProvider),
                        //     ref.read(sessionObjectivesProvider),
                        //     ref.read(sessionTherapeuticArchievementsProvider),
                        //     ref.read(globalSelectedConsultantIDProvider),
                        //     ref.read(globalUserInformationProvider)!.personalID,
                        //   );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(AppLocalizations.of(context)!
                                .genericSelectionText),
                          ),
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
    );
  }
}
