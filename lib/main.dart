import 'package:aronnax/src/Pages/settings/ServerConfigForms/Welcome/Views/first.dart';
import 'package:aronnax/src/database/model.dart';
import 'package:aronnax/src/themes/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/Pages/LoginScreen/login_main_view.dart';

late Box localdb;
late Box settingsdb;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ServerSettingsAdapter());
  Hive.registerAdapter(LocalSettingsAdapter());
  localdb = await Hive.openBox<ServerSettings>("ServerSettings");
  settingsdb = await Hive.openBox<LocalSettings>("SettingsDB");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.areSettingsEmpty();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: GlobalThemes.lightTheme,
      darkTheme: GlobalThemes.darkTheme,
      themeMode: currentTheme.currentTheme,
      home: verifyLocalData(),
    );
  }
}

verifyLocalData() {
  if (localdb.isEmpty) {
    return const FirstWelcome();
  } else {
    return const LoginScreen();
  }
}
