import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/presentation/professional_register/local_professional_register_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstWelcome extends StatelessWidget {
  const FirstWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.welcomeScreenMessage,
              style: GoogleFonts.montserrat(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Image(
              height: 300,
              image: AssetImage("assets/img/welcome.png"),
            ),
            Text(
              AppLocalizations.of(context)!.welcomeScreenImageDescription,
              style: GoogleFonts.montserrat(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocalProfessionalRegisterView(),
                  ),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.welcomeScreenStartButton,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
