import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/auth_repository_interface.dart';
import 'package:aronnax/src/domain/entities/professional.dart';
import 'package:aronnax/src/presentation/password_recover/password_recover_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordQuestionary extends ConsumerStatefulWidget {
  const PasswordQuestionary({
    super.key,
    required this.professionalData,
  });
  final Professional professionalData;

  @override
  ConsumerState<PasswordQuestionary> createState() =>
      _PasswordQuestionaryState();
}

class _PasswordQuestionaryState extends ConsumerState<PasswordQuestionary> {
  String userAnswer = '';
  bool userValidated = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: Color.fromARGB(255, 218, 218, 218),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.passwordRecoverQuestionaryTitle,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(widget.professionalData.securityQuestion),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText:
                      AppLocalizations.of(context)!.welcomeScreenYourAnswer,
                ),
                onChanged: (value) {
                  setState(() {
                    userAnswer = value;
                  });
                  formKey.currentState!.validate();
                },
                validator: (value) {
                  if (ref.read(authenticationProvider).verifyAccountOwner(
                        professionalData: widget.professionalData,
                        answerProvider: userAnswer,
                      )) {
                    setState(() {
                      userValidated = true;
                    });
                  } else {
                    setState(() {
                      userValidated = false;
                    });
                  }
                  return null;
                },
              ),
              const Padding(
                padding: EdgeInsets.all(20),
              ),
              Visibility(
                visible: userValidated,
                child: PasswordRecoverForm(
                    professionalData: widget.professionalData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
