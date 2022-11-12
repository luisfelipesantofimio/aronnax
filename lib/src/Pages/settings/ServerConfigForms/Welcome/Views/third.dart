import 'package:aronnax/src/API/server_api.dart';
import 'package:aronnax/src/Pages/settings/ServerConfigForms/Welcome/Views/professional_create.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdStep extends StatelessWidget {
  const ThirdStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¡Ya casi terminas!",
              style: GoogleFonts.montserrat(
                  fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Image(
                height: 300,
                image: AssetImage("assets/img/create.png"),
              ),
            ),
            Text(
              "¡Ya se ha configurado tu base de datos!\nEs hora de crearla en el servidor.",
              style: GoogleFonts.montserrat(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                onPressed: () {
                  createTables();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const NewProfessional()),
                    ),
                  );
                },
                child: Text(
                  "Crear base datos y continuar",
                  style:
                      GoogleFonts.montserrat(fontSize: 15, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
