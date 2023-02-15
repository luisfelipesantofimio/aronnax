import 'package:aronnax/src/presentation/main_menu/main_menu.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainMenu(),
          ),
        );
      },
      child: const Text("Entrar de todos modos"),
    );
  }
}
