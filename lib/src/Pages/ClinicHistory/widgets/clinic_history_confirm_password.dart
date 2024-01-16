import 'package:aronnax/src/Pages/ClinicHistory/clinic_history_view/clinic_history_view.dart';
import 'package:aronnax/src/data/providers/global_user_information_provider.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClinicHistoryConfirmPasswordDialog extends ConsumerStatefulWidget {
  const ClinicHistoryConfirmPasswordDialog({super.key});

  @override
  ClinicHistoryConfirmPasswordDialogState createState() =>
      ClinicHistoryConfirmPasswordDialogState();
}

class ClinicHistoryConfirmPasswordDialogState
    extends ConsumerState<ClinicHistoryConfirmPasswordDialog> {
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
                  if (!AppMethods()
                      .isPasswordValid(ref.read(userPasswordProvider), value)) {
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
                  return null;
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
