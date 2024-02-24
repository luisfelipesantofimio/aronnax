import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/remote_database/server_api.dart';
import 'package:aronnax/src/presentation/welcome_screens/professional_create.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdStep extends StatelessWidget {
  const ThirdStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.welcomeScreenAlmostDone,
              style: GoogleFonts.montserrat(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Image(
                height: 300,
                image: AssetImage("assets/img/create.png"),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.welcomeScreenDatabaseConfigured,
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
                  AppLocalizations.of(context)!
                      .welcomeScreenCreateDatabaseAndContinue,
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
