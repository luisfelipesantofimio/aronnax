import 'package:aronnax/src/Pages/Formulary/Forms/sessions_form.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SessionHeader extends ConsumerWidget {
  const SessionHeader({Key? key, required this.userNames}) : super(key: key);
  final String userNames;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage("assets/img/contact.png"),
          fit: BoxFit.fill,
        ),
      ),
      width: double.infinity,
      height: double.maxFinite,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Nueva sesión",
            style: GoogleFonts.montserrat(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fecha de la sesión:",
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
                Text(
                  "Sesión realizada por:",
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
                  "Nombre del consultante:",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  userNames,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
