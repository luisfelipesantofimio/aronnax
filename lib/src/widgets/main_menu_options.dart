import 'package:aronnax/src/Pages/Consultations/clinic_history_consultation/clinic_history_view.dart';
import 'package:aronnax/src/Pages/Consultations/main_consult/consultation_view.dart';
import 'package:aronnax/src/Pages/Formulary/basic_form/basic_form_view.dart';
import 'package:aronnax/src/Pages/Formulary/clinic_history/clinic_history_form_view.dart';
import 'package:aronnax/src/Pages/Formulary/session/session_form_view.dart';
import 'package:aronnax/src/Pages/Formulary/widgets/consultant_selection_dialog.dart';
import 'package:aronnax/src/widgets/main_options_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainMenuOptions extends StatelessWidget {
  const MainMenuOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: MainOptionsButton(
                    icon: FontAwesomeIcons.comment,
                    text: "Registrar consultante",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const MainViewRegister()),
                        ),
                      );
                    }),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: MainOptionsButton(
                    icon: FontAwesomeIcons.filePen,
                    text: "Abrir historia clínica",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const ConsultantSelectionDialog(
                            destinationRoute: MainViewClinicHistory(),
                            title:
                                "Selecciona a quién se asignará la historia clínica",
                          );
                        },
                      );
                    }),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: MainOptionsButton(
                    icon: FontAwesomeIcons.doorOpen,
                    text: "Iniciar consulta",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const ConsultantSelectionDialog(
                          title: "Selecciona al consultante",
                          destinationRoute: MainViewSession(),
                        ),
                      );
                    }),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: MainOptionsButton(
                    icon: FontAwesomeIcons.magnifyingGlass,
                    text: "Consultar historia clínica",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const UserConsultation()),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
