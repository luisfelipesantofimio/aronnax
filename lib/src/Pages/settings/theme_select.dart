import 'package:aronnax/src/data/providers/dark_mode_provider.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSelector extends ConsumerStatefulWidget {
  const ThemeSelector({Key? key}) : super(key: key);

  @override
  ThemeSelectorState createState() => ThemeSelectorState();
}

class ThemeSelectorState extends ConsumerState<ThemeSelector> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Activar tema oscuro",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Column(
            children: [
              Switch(
                value: ref.watch(darkThemeProvider) == ThemeMode.light,
                onChanged: (switchVal) {
                  ref.watch(darkThemeProvider.notifier);
                  //.updateCurrentTheme();
                },
                activeColor: Colors.blueGrey,
                activeTrackColor: Colors.green,
              ),
              Text(
                ref.watch(darkThemeProvider) == ThemeMode.light
                    ? "Modo claro"
                    : "Modo oscuro",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
