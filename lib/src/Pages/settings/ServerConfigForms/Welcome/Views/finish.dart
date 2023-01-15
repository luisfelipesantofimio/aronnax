import 'package:aronnax/src/presentation/login/login_main_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinishConfig extends StatelessWidget {
  const FinishConfig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Eso es todo",
              style: GoogleFonts.montserrat(
                  fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Image(
                height: 300,
                image: AssetImage("assets/img/finish.png"),
              ),
            ),
            Text(
              "Ahora puedes iniciar sesión y empezar a mejorar la calidad de vida de tus consultantes.",
              style: GoogleFonts.montserrat(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Text(
                "Empezar a usar Aronnax",
                style:
                    GoogleFonts.montserrat(fontSize: 15, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
