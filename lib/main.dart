import 'package:aronnax/src/data/providers/settings_provider.dart';
import 'package:aronnax/src/presentation/loading_screen/loading_screen.dart';
import 'package:aronnax/src/presentation/themes/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
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
  }

  @override
  Widget build(BuildContext context) {
    final settingsStream = ref.watch(settingsStreamProvider);

    return settingsStream.when(
      data: (data) => MaterialApp(
        theme: GlobalThemes.lightTheme,
        darkTheme: GlobalThemes.darkTheme,
        themeMode: data.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
        home: const LoadingScreen(),
      ),
      error: (error, stackTrace) => Center(
        child: Text("Something went wrong. $error"),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
