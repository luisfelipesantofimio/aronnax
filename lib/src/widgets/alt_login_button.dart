import 'package:flutter/material.dart';

import '../Pages/MainMenu/main_menu.dart';

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
