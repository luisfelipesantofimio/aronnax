import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/auth_repository_interface.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/password_recover/password_recover_view.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordRecoverDialog extends ConsumerStatefulWidget {
  const PasswordRecoverDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<PasswordRecoverDialog> createState() =>
      _PasswordRecoverDialogState();
}

class _PasswordRecoverDialogState extends ConsumerState<PasswordRecoverDialog> {
  final formKey = GlobalKey<FormState>();
  bool userExists = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.passwordRecoverDialogTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText:
                        AppLocalizations.of(context)!.passwordRecoverDialogHint,
                  ),
                  onChanged: (value) async {
                    userExists = await ref
                        .read(authenticationProvider)
                        .loginLocalUser(ref: ref, userName: value);
                    setState(() {});
                    formKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!
                          .passwordRecoverDialogErrorEmpty;
                    }
                    if (!userExists) {
                      return AppLocalizations.of(context)!
                          .passwordRecoverDialogErrorDontExist;
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                Visibility(
                  visible: userExists,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: GenericMinimalButton(
                        title: AppLocalizations.of(context)!.continueButton,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PasswordRecoverView(
                                  professionalData:
                                      ref.read(globalUserInformationProvider)!),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
