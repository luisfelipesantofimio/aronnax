import 'package:aronnax/src/data/API/server_api.dart';
import 'package:aronnax/src/global/user_global_values.dart';
import 'package:aronnax/src/presentation/login/login_form.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String currentPassword = "";
String newPassword = "";
String confirmNewPassword = "";
bool userPasswordValid = false;
bool isNewPasswordValid = false;
bool dataVerified = false;
bool isPasswordVisible = true;
Crypt _hashNewPassword = Crypt.sha256(confirmNewPassword);

class UpdatePasswordDialog extends ConsumerStatefulWidget {
  const UpdatePasswordDialog({Key? key}) : super(key: key);

  @override
  UpdatePasswordDialogState createState() => UpdatePasswordDialogState();
}

class UpdatePasswordDialogState extends ConsumerState<UpdatePasswordDialog> {
  final _updatePasswordKey = GlobalKey<FormState>();
  isPasswordValid(String serverPassword, String inputPassword) {
    bool result = Crypt(serverPassword).match(inputPassword);
    if (result == true) {
      setState(() {
        userPasswordValid = true;
      });
    } else {
      setState(() {
        userPasswordValid = false;
      });
    }
  }

  passwordCompare(String arg1, String arg2) {
    if (arg1 == arg2 && arg1.isNotEmpty && arg2.isNotEmpty) {
      setState(() {
        isNewPasswordValid = true;
      });
    } else {
      setState(() {
        isNewPasswordValid = false;
      });
    }
  }

  verifyData() {
    if (isNewPasswordValid == true && userPasswordValid == true) {
      setState(() {
        dataVerified = true;
      });
    } else {
      setState(() {
        dataVerified = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          "Actualizar contraseña para ${ref.read(globalUserNameProvider)}"),
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            Form(
              key: _updatePasswordKey,
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    obscureText: isPasswordVisible,
                    onChanged: (value) {
                      setState(() {
                        currentPassword = value;
                      });
                      isPasswordValid(passwordInServer, currentPassword);
                      verifyData();
                      _updatePasswordKey.currentState!.validate();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ingresa tu contraseña";
                      }
                      if (!userPasswordValid) {
                        return "Contraseña incorrecta";
                      } else {
                        null;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Contraseña actual",
                    ),
                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: isPasswordVisible,
                    onChanged: (value) {
                      setState(() {
                        newPassword = value;
                      });
                      passwordCompare(newPassword, confirmNewPassword);
                      verifyData();
                    },
                    decoration:
                        const InputDecoration(hintText: "Nueva contraseña"),
                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: isPasswordVisible,
                    onChanged: (value) {
                      setState(() {
                        confirmNewPassword = value;
                      });
                      passwordCompare(newPassword, confirmNewPassword);
                      verifyData();
                      _updatePasswordKey.currentState!.validate();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ingresa tu contraseña";
                      }
                      if (!isNewPasswordValid) {
                        return "Las contraseñas no coinciden";
                      } else {
                        null;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Confirma la nueva contraseña"),
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: dataVerified,
                        child: TextButton(
                          onPressed: () {
                            _updatePasswordKey.currentState!.validate();

                            updatePassword(
                                int.parse(
                                    ref.read(globalProfessionalIDProvider)),
                                _hashNewPassword.toString());

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "${ref.read(globalUserNameProvider)}, se ha actualizado tu contraseña"),
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: const Text("Actualizar contraseña"),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      Icon(userPasswordValid
                          ? Icons.check_circle
                          : Icons.cancel),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
