import 'package:aronnax/src/Pages/Formulary/Forms/clinic_history.dart';
import 'package:aronnax/src/Pages/Formulary/clinic_history/header.dart';
import 'package:aronnax/src/Pages/Formulary/widgets/consultant_selection_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainViewClinicHistory extends StatelessWidget {
  const MainViewClinicHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: HeaderClinicHistory(
                  patientNames: globalSelectedConsultantNames),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Historia clínica",
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
                    child: ClinicHistory(patientID: globalSelectedConsultantID),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconButton(
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
