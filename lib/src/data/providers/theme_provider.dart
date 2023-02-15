import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModeProvider extends StateNotifier<ThemeMode> {
  ThemeModeProvider() : super(ThemeMode.light);

  void getCurrentTheme(WidgetRef ref) async {
    final settings =
        await ref.watch(localDatabaseRepositoryProvider).getLocalSettings();
    settings.isDarkModeEnabled
        ? state = ThemeMode.dark
        : state = ThemeMode.light;
  }

  void swithThemeMode(WidgetRef ref, bool newValue) {
    newValue ? state = ThemeMode.dark : state = ThemeMode.light;
  }
}

final themeProvider = StateNotifierProvider<ThemeModeProvider, ThemeMode>(
  (ref) => ThemeModeProvider(),
);
