import 'package:aronnax/src/domain/entities/professional.dart';
import 'package:aronnax/src/presentation/password_recover/password_pin_recover.dart';
import 'package:aronnax/src/presentation/password_recover/password_questionary.dart';
import 'package:flutter/material.dart';

class PasswordRecoverView extends StatelessWidget {
  const PasswordRecoverView({
    super.key,
    required this.professionalData,
  });
  final Professional professionalData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: PasswordQuestionary(professionalData: professionalData)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: PasswordPinRecover(
                professionalData: professionalData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
