import 'package:aronnax/src/Pages/Formulary/widgets/consultant_selection_dialog.dart';
import 'package:aronnax/src/data/database/local_model/local_queries.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/forms_providers/session_form_provider.dart';
import 'package:aronnax/src/data/remote_database/server_api.dart';
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
    Key? key,
    required this.patientData,
    required this.patientCaseData,
  }) : super(key: key);
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
    bool isOfflineEnabled = ref.watch(offlineStatusProvider).value!;

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
                  Text('Cómo estuvo la sesión?',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const Text(
                      'Asigna el elemento que mejor describa el desarrollo de esta sesión:'),
                  const Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SessionPerformanceElement(
                        icon: FontAwesomeIcons.faceSadTear,
                        title: 'Mal',
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
                        title: 'Regular',
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
                        title: 'Bien',
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
                        const Text('Performance explanation (optional)'),
                        TextField(
                          onChanged: (value) => setState(() {
                            performanceExplanation = value;
                          }),
                          decoration: const InputDecoration(
                              hintText: 'Your explanation here.'),
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
                    title: 'Continuar',
                    onPressed: () {
                      if (selectedItem != null) {
                        // isOfflineEnabled
                        //     ?
                        addLocalSession(
                          sessionSummary: ref.read(sessionSummaryProvider),
                          sessionObjectives:
                              ref.read(sessionObjectivesProvider),
                          therapeuticArchievements:
                              ref.read(sessionTherapeuticArchievementsProvider),
                          idNumber: widget.patientData.id,
                          professionalID:
                              ref.read(globalUserInformationProvider)!.id,
                          sessionDate: DateTime.now(),
                          caseId: widget.patientCaseData.id,
                          sessionNotes: ref.read(sessionNotesProvider),
                          sessionPerformance: selectedItem!,
                          sessionPerformanceExplanation: performanceExplanation,
                        );
                        Navigator.push(
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
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Selecciona una opción'),
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
