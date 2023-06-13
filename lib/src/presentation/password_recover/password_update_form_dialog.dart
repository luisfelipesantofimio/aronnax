import 'dart:math';

import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordUpdateFormDialog extends ConsumerStatefulWidget {
  const PasswordUpdateFormDialog({
    Key? key,
    required this.updateWithPin,
    required this.onPasswordChanged,
  }) : super(key: key);
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
                const Text(
                  'Update your password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Your new password'),
                  onChanged: (value) {
                    setState(() {
                      newPassword = value;
                    });
                    formKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'The field must not be empty';
                    }
                    if (value.length < 8) {
                      return 'The password must have at least 8 characters.';
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Your new password'),
                  onChanged: (value) {
                    setState(() {
                      newPasswordConfirm = value;
                    });
                    formKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'The field must not be empty';
                    }
                    if (value.length < 8) {
                      return 'The password must have at least 8 characters.';
                    }
                    if (newPasswordConfirm != newPassword) {
                      return "The password don't match";
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
                                child: const Text(
                                    'Your pin (Single use generated number for recovering your account)'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    newPin.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    tooltip: 'Regenerate pin',
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
                                    tooltip: 'Copy pin',
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
                  title: 'Update password',
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
