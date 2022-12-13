import 'package:aronnax/src/Pages/ClinicHistory/clinic_hostory_view/clinic_history_view.dart';
import 'package:aronnax/src/Pages/LoginScreen/login_form.dart';
import 'package:aronnax/src/global/controllers.dart';
import 'package:aronnax/src/global/method.dart';
import 'package:flutter/material.dart';

class ClinicHistoryConfirmPasswordDialog extends StatefulWidget {
  const ClinicHistoryConfirmPasswordDialog({Key? key}) : super(key: key);

  @override
  State<ClinicHistoryConfirmPasswordDialog> createState() =>
      _ClinicHistoryConfirmPasswordDialogState();
}

class _ClinicHistoryConfirmPasswordDialogState
    extends State<ClinicHistoryConfirmPasswordDialog> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 186, 230, 230),
      content: SizedBox(
        height: 300,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Antes de continuar, confirma tu contraseña"),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Form(
              key: verfiFormkey,
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10, top: 0),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                autofocus: true,
                obscureText: hidePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Ingresa tu contraseña";
                  }
                  if (!isPasswordValid(passwordInServer, value)) {
                    return "Contraseña incorrecta";
                  } else {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClinicHistoryView(),
                      ),
                    );
                  }
                },
                onChanged: (value) {
                  verfiFormkey.currentState!.validate();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
