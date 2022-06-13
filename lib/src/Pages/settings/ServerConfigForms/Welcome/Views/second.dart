import 'package:aronnax/src/Pages/settings/ServerConfigForms/Welcome/Views/create_server.dart';
import 'package:aronnax/src/Pages/settings/ServerConfigForms/Welcome/Views/server_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondWelcome extends StatelessWidget {
  const SecondWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "¿Qué deseas hacer?",
              style: GoogleFonts.montserrat(
                  fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Image(
              height: 300,
              image: AssetImage("assets/img/choose.png"),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 500,
                  child: Column(
                    children: [
                      Text(
                        "Configurar un nuevo servidor",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Si es la primera vez que utilizas Aronnax, elije esta opción para que configuremos todo por ti.",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ServerCreate(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 500,
                  child: Column(
                    children: [
                      Text(
                        "Conectarme a un servidor existente",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Si ya haz utilizado y configurado Aronnax para tu equipo o para ti, elije esta opción para conectarte.",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ServerConfig(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
