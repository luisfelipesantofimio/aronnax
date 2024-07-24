
import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/settings_repository_interface.dart';
import 'package:aronnax/src/data/providers/theme_provider.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSelector extends ConsumerWidget {
  const ThemeSelector({super.key, required this.settingsData});
  final AsyncValue<Setting> settingsData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return settingsData.when(
      data: (data) => Center(
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
                  value: data.isDarkModeEnabled,
                  onChanged: (switchVal) {
                    ref
                        .read(themeProvider.notifier)
                        .swithThemeMode(ref, switchVal);
                    ref
                        .read(settingsRepositoryProvider)
                        .switchCurrentTheme(ref, data.isDarkModeEnabled);
                  },
                  activeColor: Colors.blueGrey,
                  activeTrackColor: Colors.green,
                ),
                Text(
                  data.isDarkModeEnabled ? "Modo oscuro" : "Modo claro",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => const Center(
        child: Text("F"),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
