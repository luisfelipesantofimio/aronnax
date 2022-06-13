import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      //width: 300, -> Para recordar: esto daña el header.
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/img/Crearte Consciencia Black.png"),
            ),
            Text(
              "Aronnax",
              style: GoogleFonts.montserrat(
                  color: const Color.fromRGBO(65, 65, 67, 1), fontSize: 38),
            ),
          ],
        ),
      ),
    );
  }
}
