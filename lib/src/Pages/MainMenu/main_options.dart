import 'package:aronnax/src/Pages/Consultations/main_consult/consultation_view.dart';
import 'package:aronnax/src/Pages/Formulary/basic_form/basic_form_view.dart';
import 'package:aronnax/src/Pages/Formulary/clinic_history/clinic_history_form_view.dart';
import 'package:aronnax/src/Pages/Formulary/session/session_form_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainOptions extends StatelessWidget {
  const MainOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(60),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 83, 174, 84),
                          shadowColor: Colors.black,
                          textStyle: GoogleFonts.montserrat(
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainViewRegister(),
                            ),
                          );
                        },
                        child: const Text("Registrar nuevo consultante"),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 110, 193, 231),
                          shadowColor: Colors.black,
                          textStyle: GoogleFonts.montserrat(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const MainViewClinicHistory(),
                            ),
                          );
                        },
                        child: const Text("Crear historia clínica"),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 110, 193, 231),
                          textStyle: GoogleFonts.montserrat(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainViewSession(),
                            ),
                          );
                        },
                        child: const Text("Iniciar consulta"),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black,
                          primary: const Color.fromARGB(255, 110, 193, 231),
                          textStyle: GoogleFonts.montserrat(
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserConsultation(),
                            ),
                          );
                        },
                        child: const Text("Consultar historia clínica"),
                      ),
                    ),
                  ),
                ],
              ),
              Row()
            ],
          ),
        ),
      ),
    );
  }
}
