import 'package:aronnax/src/presentation/core/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/theme_provider.dart';
import 'package:aronnax/src/presentation/loading_screen/loading_screen.dart';
import 'package:aronnax/src/presentation/themes/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!(AppConstants.supabaseUrl == "" || AppConstants.supabaseKey == "")) {
    await Supabase.initialize(
      url: AppConstants.supabaseUrl,
      anonKey: AppConstants.supabaseKey,
    );
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  void didChangeDependencies() {
    ref.read(themeProvider.notifier).getCurrentTheme(ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: GlobalThemes.lightTheme,
      darkTheme: GlobalThemes.darkTheme,
      themeMode: ref.watch(themeProvider),
      home: const LoadingScreen(),
    );
  }
}
