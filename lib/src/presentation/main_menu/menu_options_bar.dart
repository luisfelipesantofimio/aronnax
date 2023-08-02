import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/Pages/Formulary/widgets/consultant_selection_dialog.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/domain/entities/patient_case.dart';
import 'package:aronnax/src/domain/entities/session.dart';
import 'package:aronnax/src/presentation/main_menu/menu_settings_option_container.dart';
import 'package:aronnax/src/presentation/register_view/register_view.dart';
import 'package:aronnax/src/presentation/session_creation_view/session_form_view.dart';
import 'package:aronnax/src/presentation/widgets/menu_options_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuOptionsBar extends ConsumerStatefulWidget {
  const MenuOptionsBar({Key? key}) : super(key: key);

  @override
  ConsumerState<MenuOptionsBar> createState() => _MenuOptionsBarState();
}

class _MenuOptionsBarState extends ConsumerState<MenuOptionsBar> {
  bool isMouseIn = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      decoration: const BoxDecoration(color: Color.fromARGB(255, 4, 1, 40)),
      height: MediaQuery.of(context).size.height,
      width: isMouseIn
          ? MediaQuery.of(context).size.width * 0.2
          : MediaQuery.of(context).size.width * 0.1,
      child: MouseRegion(
        onEnter: (event) => setState(() {
          isMouseIn = true;
        }),
        onExit: (event) => setState(
          () {
            isMouseIn = false;
          },
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  MenuOptionsBarItem(
                    icon: FontAwesomeIcons.clipboardUser,
                    title: AppLocalizations.of(context)!
                        .mainMenuOptionsBarTitleRegisterConsultant,
                    isFullSize: isMouseIn,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const MainViewRegister()),
                      ),
                    ),
                  ),
                  MenuOptionsBarItem(
                    icon: FontAwesomeIcons.doorOpen,
                    title: AppLocalizations.of(context)!
                        .mainMenuOptionsBarTitleStartConsultation,
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => ConsultantSelectionDialog(
                        onSearchedPatient: (patient) async {
                          PatientCase? caseData = await ref
                              .read(patientsRepositoryProvider)
                              .getPatientActiveCase(ref, patient.id);
                          List<Session> sessionsList = await ref
                              .read(patientsRepositoryProvider)
                              .getPatientSessionsList(ref, patient.id);
                          if (caseData == null) {
                            Future(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    AppLocalizations.of(context)!
                                        .mainMenuOptionsBarAlertCaseNotFound(
                                            patient.names),
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            });
                          } else {
                            Future(
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SessionFormView(
                                    patientData: patient,
                                    patientCaseData: caseData,
                                    patientSessionAmount: sessionsList.length,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        title: AppLocalizations.of(context)!
                            .mainMenuOptionsBarPatientSelectionDialogTitle,
                      ),
                    ),
                    isFullSize: isMouseIn,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    isMouseIn
                        ? const MenuSettingsOptionContainer()
                        : const Icon(
                            FontAwesomeIcons.gear,
                            color: Colors.white,
                          ),
                    const Padding(
                      padding: EdgeInsets.all(40),
                    ),
                    const Image(
                      width: 50,
                      image: AssetImage('assets/img/aronnax-icon-light.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
