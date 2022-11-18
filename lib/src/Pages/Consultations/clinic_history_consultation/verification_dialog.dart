import 'package:aronnax/src/Pages/Consultations/clinic_history_consultation/clinic_history_view.dart';
import 'package:aronnax/src/global/user_global_values.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aronnax/src/Pages/LoginScreen/login_form.dart';

String currentPassword = "";
bool isVerified = false;

class VerifyProfessional extends ConsumerStatefulWidget {
  const VerifyProfessional({Key? key}) : super(key: key);

  @override
  VerifyProfessionalState createState() => VerifyProfessionalState();
}

class VerifyProfessionalState extends ConsumerState<VerifyProfessional> {
  final _verfiFormkey = GlobalKey<FormState>();

  isPasswordValid(String serverPassword, String inputPassword) {
    bool result = Crypt(serverPassword).match(currentPassword);
    if (result == true) {
      setState(() {
        isVerified = true;
      });
    }
  }

  isUserVerified() {
    if (isVerified == true) {
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ClinicHistoryView(),
        ),
      );
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "${ref.read(globalUserNameProvider)}, haz ingresado una contraseña incorrecta."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Verifica tu contraseña",
        style:
            GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      alignment: Alignment.center,
      content: SizedBox(
        height: 200,
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _verfiFormkey,
              child: TextFormField(
                autofocus: true,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Ingresa tu contraseña";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    currentPassword = value!;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancelar",
            style: GoogleFonts.montserrat(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            _verfiFormkey.currentState!.save();
            isPasswordValid(passwordInServer, currentPassword);
            isUserVerified();
          },
          child: Text(
            "Verificar",
            style: GoogleFonts.montserrat(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
