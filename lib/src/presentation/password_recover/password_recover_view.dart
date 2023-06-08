import 'package:aronnax/src/domain/entities/professional.dart';
import 'package:aronnax/src/presentation/password_recover/password_questionary.dart';
import 'package:flutter/material.dart';

class PasswordRecoverView extends StatelessWidget {
  const PasswordRecoverView({
    Key? key,
    required this.professionalData,
  }) : super(key: key);
  final Professional professionalData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: PasswordQuestionary(professionalData: professionalData)),
          ),
        ],
      ),
    );
  }
}
