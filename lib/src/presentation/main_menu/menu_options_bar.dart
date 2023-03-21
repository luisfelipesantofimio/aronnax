import 'package:aronnax/src/Pages/ClinicHistory/clinic_history_search.dart';
import 'package:aronnax/src/Pages/Formulary/widgets/consultant_selection_dialog.dart';
import 'package:aronnax/src/presentation/main_menu/menu_settings_option_container.dart';
import 'package:aronnax/src/presentation/register_view/register_view.dart';
import 'package:aronnax/src/presentation/session_creation_view/session_form_view.dart';
import 'package:aronnax/src/presentation/widgets/menu_options_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuOptionsBar extends StatefulWidget {
  const MenuOptionsBar({Key? key}) : super(key: key);

  @override
  State<MenuOptionsBar> createState() => _MenuOptionsBarState();
}

class _MenuOptionsBarState extends State<MenuOptionsBar> {
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
                    title: 'Registrar consultante',
                    isFullSize: isMouseIn,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const MainViewRegister()),
                      ),
                    ),
                  ),
                  // MenuOptionsBarItem(
                  //   icon: FontAwesomeIcons.notesMedical,
                  //   title: 'Abrir nuevo caso',
                  //   onTap: () => showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return ConsultantSelectionDialog(
                  //         onSearchedPatient: (patient) {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => CaseCreationView(
                  //                 patientData: patient,
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //         title: "Selecciona a quién se asignará el caso",
                  //       );
                  //     },
                  //   ),
                  //   isFullSize: isMouseIn,
                  // ),
                  MenuOptionsBarItem(
                    icon: FontAwesomeIcons.doorOpen,
                    title: 'Iniciar consulta',
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => ConsultantSelectionDialog(
                        onSearchedPatient: (patient) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SessionFormView(patientData: patient),
                            ),
                          );
                        },
                        title: "Selecciona al consultante",
                      ),
                    ),
                    isFullSize: isMouseIn,
                  ),
                  MenuOptionsBarItem(
                    icon: FontAwesomeIcons.magnifyingGlass,
                    title: 'Consultar historia clínica',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const ClinicHistorySearchView()),
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
