import 'dart:math';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordUpdateFormDialog extends ConsumerStatefulWidget {
  const PasswordUpdateFormDialog({
    super.key,
    required this.updateWithPin,
    required this.onPasswordChanged,
  });
  final bool updateWithPin;
  final Function(String newPassword, int newPin) onPasswordChanged;

  @override
  ConsumerState<PasswordUpdateFormDialog> createState() =>
      _PasswordUpdateFormDialogState();
}

class _PasswordUpdateFormDialogState
    extends ConsumerState<PasswordUpdateFormDialog> {
  final formKey = GlobalKey<FormState>();
  String newPassword = '';
  String newPasswordConfirm = '';
  int? newPin;

  @override
  void initState() {
    setState(() {
      newPin = int.parse(
        List.generate(6, (index) => Random().nextInt(9)).toList().join(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.profileNewPasswordUpdateButton,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!
                          .profileNewPasswordNewPassword),
                  onChanged: (value) {
                    setState(() {
                      newPassword = value;
                    });
                    formKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
                    }
                    if (value.length < 8) {
                      return AppLocalizations.of(context)!
                          .genericMinimumCharacters("8");
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!
                        .profileNewPasswordNewPassword,
                  ),
                  onChanged: (value) {
                    setState(() {
                      newPasswordConfirm = value;
                    });
                    formKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
                    }
                    if (value.length < 8) {
                      return AppLocalizations.of(context)!
                          .genericMinimumCharacters("8");
                    }
                    if (newPasswordConfirm != newPassword) {
                      return AppLocalizations.of(context)!
                          .genericErrorPasswordsDontMatch;
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                Visibility(
                  visible: widget.updateWithPin,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.height * 0.4,
                                child: Text(AppLocalizations.of(context)!
                                    .passwordRecoverPinTitle),
                              ),
                              Row(
                                children: [
                                  Text(
                                    newPin.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    tooltip: AppLocalizations.of(context)!
                                        .welcomeScreenRegeneratePin,
                                    onPressed: () {
                                      setState(() {
                                        newPin = int.parse(List.generate(6,
                                                (index) => Random().nextInt(9))
                                            .join());
                                      });
                                    },
                                    icon: const Icon(Icons.refresh),
                                  ),
                                  IconButton(
                                    tooltip: AppLocalizations.of(context)!
                                        .passwordRecoverCopyPin,
                                    onPressed: () {
                                      Clipboard.setData(
                                        ClipboardData(
                                          text: newPin.toString(),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.copy,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GenericMinimalButton(
                  title: AppLocalizations.of(context)!
                      .settingsScreenPersonalInfoUpdatePassword,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      widget.onPasswordChanged(
                        newPasswordConfirm,
                        newPin!,
                      );
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
