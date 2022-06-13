import 'package:aronnax/src/Pages/Formulary/professionalForm/professional_form.dart';
import 'package:aronnax/src/Pages/settings/ServerConfigForms/Welcome/Views/finish.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewProfessional extends StatelessWidget {
  const NewProfessional({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: NewProfessionalHeader(),
          ),
          Column(
            children: [
              const Expanded(
                child: SizedBox(
                  width: 900,
                  height: 350,
                  child: ProfessionalForm(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FinishConfig(),
                      ),
                    );
                  },
                  child: Text(
                    "Continuar",
                    style: GoogleFonts.montserrat(
                        fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewProfessionalHeader extends StatelessWidget {
  const NewProfessionalHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.maxFinite,
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ingresa tus datos personales",
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Este paso es necesario para asociar las historias clíncias que creas a tu nombre.\nTambién es necesario para iniciar sesión al finalizar la configuración.",
                  style:
                      GoogleFonts.montserrat(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
