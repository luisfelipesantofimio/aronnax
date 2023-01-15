import 'package:aronnax/main.dart';
import 'package:aronnax/src/data/database/settings_db/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkThemeNotifier extends StateNotifier<ThemeMode> {
  DarkThemeNotifier() : super(ThemeMode.light);

  bool isDarkThemeEnabled = false;
  void getCurrentTheme() async {
    final db = isar.collection<Settings>();
    final darkTheme = await db.get(0);
    isDarkThemeEnabled = darkTheme!.isDarkModeEnabled!;
    state = isDarkThemeEnabled ? ThemeMode.dark : ThemeMode.light;
  }

  void updateCurrentTheme() async {
    final db = isar.collection<Settings>();
    final darkTheme = await db.get(0);
    darkTheme!.isDarkModeEnabled = !darkTheme.isDarkModeEnabled!;
    state = darkTheme.isDarkModeEnabled! ? ThemeMode.dark : ThemeMode.light;
    await isar.writeTxn(() async {
      await isar.settings.put(darkTheme);
    });
  }
}

final darkThemeProvider = StateNotifierProvider<DarkThemeNotifier, ThemeMode>(
  (ref) => DarkThemeNotifier(),
);
