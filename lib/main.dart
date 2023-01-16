import 'package:aronnax/src/data/database/settings_db/settings.dart';
import 'package:aronnax/src/data/providers/dark_mode_provider.dart';
import 'package:aronnax/src/misc/departments_list.dart';
import 'package:aronnax/src/presentation/loading_screen/loading_screen.dart';
import 'package:aronnax/src/themes/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;

void main() async {
  final documentsDir = await getApplicationDocumentsDirectory();
  isar = await Isar.open([SettingsSchema, RemoteDatabaseAccessSchema],
      directory: documentsDir.path, name: "Aronnax_settings");
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
    return MaterialApp(
      theme: GlobalThemes.lightTheme,
      darkTheme: GlobalThemes.darkTheme,
      themeMode: ref.watch(darkThemeProvider),
      home: const LoadingScreen(),
    );
  }
}
