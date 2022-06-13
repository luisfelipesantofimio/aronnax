import 'package:aronnax/src/Pages/settings/ServerConfigForms/Welcome/Forms/server_create.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServerCreate extends StatelessWidget {
  const ServerCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Header(),
            ),
            Column(
              children: [
                const Expanded(
                  child: SizedBox(
                    width: 900,
                    height: 350,
                    child: NewServerForm(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton(
                    tooltip: "Volver",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
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

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.maxFinite,
        color: Colors.blue,
        child: Center(
          child: Text(
            "Ingresa la información del nuevo servidor",
            style: GoogleFonts.montserrat(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
