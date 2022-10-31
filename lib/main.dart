import 'package:aronnax/src/Pages/settings/ServerConfigForms/Welcome/Views/first.dart';
import 'package:aronnax/src/database/local_model/local_model.dart';
import 'package:aronnax/src/database/local_model/local_queries.dart';
import 'package:aronnax/src/database/settings_model.dart';
import 'package:aronnax/src/providers/global_providers.dart';
import 'package:aronnax/src/themes/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/Pages/LoginScreen/login_main_view.dart';

late Box localdb;
late Box themeDB;
late Box offlineModeDB;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ServerSettingsAdapter());
  Hive.registerAdapter(GlobalThemeModeAdapter());
  Hive.registerAdapter(LocalDatabaseModeAdapter());
  localdb = await Hive.openBox<ServerSettings>("ServerSettings");
  themeDB = await Hive.openBox<GlobalThemeMode>("SettingsDB");
  offlineModeDB = await Hive.openBox<LocalDatabaseMode>("offlineModeDB");
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
    super.initState();

    currentTheme.areSettingsEmpty();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // bool currentOfflineModeState = ref.watch(globalOfflineStatusProvider);
    verifyLocalData() {
      if (offlineModeDB.isEmpty) {
        return const FirstWelcome();
      } else {
        return const LoginScreen();
      }
    }

    return MaterialApp(
      theme: GlobalThemes.lightTheme,
      darkTheme: GlobalThemes.darkTheme,
      themeMode: currentTheme.currentTheme,
      home: verifyLocalData(),
    );
  }
}
