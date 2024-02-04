import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/global_user_information_provider.dart';
import 'package:aronnax/src/data/remote_database/server_api.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdatePasswordDialog extends ConsumerStatefulWidget {
  const UpdatePasswordDialog({super.key});

  @override
  UpdatePasswordDialogState createState() => UpdatePasswordDialogState();
}

class UpdatePasswordDialogState extends ConsumerState<UpdatePasswordDialog> {
  final _updatePasswordKey = GlobalKey<FormState>();
  String currentPassword = "";
  String newPassword = "";
  String confirmNewPassword = "";
  bool userPasswordValid = false;
  bool isNewPasswordValid = false;
  bool dataVerified = false;
  bool isPasswordVisible = true;

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
        AppLocalizations.of(context)!.profileUpdatePasswordTitle(
            ref.read(globalUserInformationProvider)!.names),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
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
                    isPasswordValid(
                        ref.read(userPasswordProvider), currentPassword);
                    verifyData();
                    _updatePasswordKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!
                          .welcomeScreenYourPassword;
                    }
                    if (!userPasswordValid) {
                      return AppLocalizations.of(context)!
                          .loginErrorIncorrectPassword;
                    } else {
                      null;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!
                        .profileNewPasswordCurrentPassword,
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
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!
                        .profileNewPasswordNewPassword,
                  ),
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
                      return AppLocalizations.of(context)!
                          .welcomeScreenYourPassword;
                    }
                    if (!isNewPasswordValid) {
                      return AppLocalizations.of(context)!
                          .genericErrorPasswordsDontMatch;
                    } else {
                      null;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!
                        .welcomeScreenConfirmPassword,
                  ),
                ),
                Row(
                  children: [
                    Visibility(
                      visible: dataVerified,
                      child: TextButton(
                        onPressed: () {
                          _updatePasswordKey.currentState!.validate();

                          final Crypt hashNewPassword =
                              Crypt.sha256(confirmNewPassword);

                          updatePassword(
                              ref
                                  .read(globalUserInformationProvider)!
                                  .personalID,
                              hashNewPassword.toString());

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                AppLocalizations.of(context)!
                                    .profileNewPasswordConfirmationSuccess,
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        },
                        child: Text(AppLocalizations.of(context)!
                            .profileNewPasswordUpdateButton),
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
                    Icon(userPasswordValid ? Icons.check_circle : Icons.cancel),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
