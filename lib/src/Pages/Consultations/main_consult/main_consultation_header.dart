import 'package:aronnax/src/Pages/Consultations/main_consult/consultation_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderConsultation extends StatelessWidget {
  const HeaderConsultation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Consultar usuarios",
              style: Theme.of(context).textTheme.headline2,
            ),
            const ShowQuery(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
