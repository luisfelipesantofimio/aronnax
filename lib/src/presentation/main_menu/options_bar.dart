import 'package:aronnax/src/Pages/Help/help_main_view.dart';
import 'package:aronnax/src/presentation/settings/settings_main.dart';
import 'package:aronnax/src/presentation/login/login_main_view.dart';
import 'package:flutter/material.dart';

class OptionsBar extends StatefulWidget {
  const OptionsBar({Key? key}) : super(key: key);

  @override
  State<OptionsBar> createState() => _OptionsBarState();
}

class _OptionsBarState extends State<OptionsBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(40),
          child: IconButton(
            iconSize: 50,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            icon: const Icon(Icons.logout_outlined),
            tooltip: "Cerrar sesión",
          ),
        ),
        Container(
          margin: const EdgeInsets.all(40),
          child: IconButton(
            iconSize: 50,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainHelpView(),
                ),
              );
            },
            icon: const Icon(Icons.help_outline),
            tooltip: "Ayuda",
          ),
        ),
        Container(
          margin: const EdgeInsets.all(40),
          child: IconButton(
            iconSize: 50,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsMain(),
                ),
              );
            },
            icon: const Icon(Icons.build_outlined),
            tooltip: "Ajustes",
          ),
        ),
      ],
    );
  }
}
