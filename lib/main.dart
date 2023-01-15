import 'package:aronnax/src/Pages/settings/ServerConfigForms/Welcome/Views/first.dart';
import 'package:aronnax/src/data/database/settings_db/settings.dart';
import 'package:aronnax/src/data/database/settings_model.dart';
import 'package:aronnax/src/misc/departments_list.dart';
import 'package:aronnax/src/presentation/login/login_main_view.dart';
import 'package:aronnax/src/themes/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

late Box localdb;
late Box themeDB;
late Box offlineModeDB;
late Isar isar;

void main() async {
  isar = await Isar.open([SettingsSchema, RemoteDatabaseAccessSchema]);
  final documentsDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter("${documentsDir.path}/aronnax/config");
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
    getStates();
    super.initState();

    currentTheme.areSettingsEmpty();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    verifyLocalData() {
      if (offlineModeDB.isNotEmpty) {
        return const LoginScreen();
      } else {
        return const FirstWelcome();
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
