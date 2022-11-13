import 'package:aronnax/src/Pages/Formulary/Forms/sessions_form.dart';
import 'package:aronnax/src/Pages/Formulary/session/header.dart';
import 'package:aronnax/src/Pages/Formulary/widgets/consultant_selection_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainViewSession extends StatelessWidget {
  const MainViewSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: SessionHeader(userNames: globalSelectedConsultantNames),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    "¿Cómo se encuentra tu consultante?",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color.fromRGBO(65, 65, 67, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 1000,
                    height: 500,
                    child: SessionsForm(patientID: globalSelectedConsultantID),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: IconButton(
                    alignment: Alignment.topCenter,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    tooltip: "Volver",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
