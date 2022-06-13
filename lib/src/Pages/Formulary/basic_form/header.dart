import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderRegister extends StatelessWidget {
  const HeaderRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage("assets/img/flowers_cover.png"),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 0.5),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
          child: Text(
            "Registrar un nuevo consultante",
            style: GoogleFonts.montserrat(
              //backgroundColor: Color.fromARGB(255, 23, 0, 51),
              fontSize: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
