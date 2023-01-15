import 'package:aronnax/src/Pages/settings/ServerConfigForms/Welcome/Views/first.dart';
import 'package:aronnax/src/data/database/settings_db/settings.dart';
import 'package:aronnax/src/data/providers/dark_mode_provider.dart';
import 'package:aronnax/src/domain/repositories/database_repository.dart';
import 'package:aronnax/src/misc/departments_list.dart';
import 'package:aronnax/src/presentation/loading_screen/loading_screen.dart';
import 'package:aronnax/src/themes/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

late Isar isar;

void main() async {
  isar = await Isar.open([SettingsSchema, RemoteDatabaseAccessSchema]);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    getStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    verifyLocalData() {
      Future(
        () async {
          if (await DatabaseRepository().isAronnaxConfigured()) {
            return const LoadingScreen();
          } else {
            return const FirstWelcome();
          }
        },
      );
    }

    return MaterialApp(
      theme: GlobalThemes.lightTheme,
      darkTheme: GlobalThemes.darkTheme,
      themeMode: ref.watch(darkThemeProvider),
      home: verifyLocalData(),
    );
  }
}
