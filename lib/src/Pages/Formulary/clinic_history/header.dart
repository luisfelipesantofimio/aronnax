import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Forms/clinic_history.dart';

class HeaderClinicHistory extends ConsumerWidget {
  const HeaderClinicHistory({Key? key, required this.patientNames})
      : super(key: key);
  final String patientNames;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage("assets/img/flowers2.png"),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: double.maxFinite,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "Registrar una nueva historia clínica",
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Historia creada por:",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${ref.read(globalUserNameProvider)} ${ref.read(globalUserLastNameProvider)}",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Nombre del contultante:",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      patientNames,
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Código único de la historia clínica:",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      registerCode,
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Fecha de creación:",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      currentDate,
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
