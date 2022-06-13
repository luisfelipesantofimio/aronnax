import 'package:aronnax/src/themes/custom_themes.dart';
import "package:flutter/material.dart";

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({Key? key}) : super(key: key);

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Activar tema oscuro",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          ValueListenableBuilder(
              valueListenable: darkThemeEnabled,
              builder: (context, box, child) {
                return Column(
                  children: [
                    Switch(
                      value: darkThemeEnabled.value,
                      onChanged: (switchVal) {
                        currentTheme.changeCurrentTheme();
                      },
                      activeColor: Colors.blueGrey,
                      activeTrackColor: Colors.green,
                    ),
                    Text(
                      darkThemeEnabled.value ? "Modo oscuro" : "Modo claro",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}
