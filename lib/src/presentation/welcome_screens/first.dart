import 'package:aronnax/src/Pages/Formulary/professionalForm/local_professional_register_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstWelcome extends StatelessWidget {
  const FirstWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Vamos a configuar algunas cosas",
              style: GoogleFonts.montserrat(
                  fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Image(
              height: 300,
              image: AssetImage("assets/img/welcome.png"),
            ),
            Text(
              "Te damos la bienvenida a Aronnax, un software de gestión de pacientes e historias clínicas para psicólogos.\nAntes de empezar, deberás configurar la base de datos donde Aronnax guardará toda la información de tus consultantes.",
              style: GoogleFonts.montserrat(fontSize: 15),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LocalProfessionalRegisterView()
                      // const SecondWelcome(),
                      ),
                );
              },
              child: Text(
                "¡Vamos!",
                style:
                    GoogleFonts.montserrat(fontSize: 20, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
