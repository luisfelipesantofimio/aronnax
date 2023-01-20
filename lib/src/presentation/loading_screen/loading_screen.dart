import 'package:aronnax/main.dart';
import 'package:aronnax/src/data/database/settings_db/settings.dart';

import 'package:aronnax/src/data/repositories/database_repository.dart';
import 'package:aronnax/src/presentation/login/login_main_view.dart';
import 'package:aronnax/src/presentation/welcome_screens/first.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  @override
  void didChangeDependencies() {
    Future(
      () async {
        if (await DatabaseRepository().isSettingsDBEmpty()) {
          await isar.writeTxn(() async {
            await isar.settings.put(Settings()
              ..id = 0
              ..isDarkModeEnabled = false
              ..isOfflineModeEnabled = true
              ..isConfigured = false);
          });
        }
      },
    );

    Future(() async {
      bool? isConfigured =
          await DatabaseRepository().isAronnaxConfigured() ?? false;
      if (isConfigured) {
        Future(
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
        );
      } else {
        Future(
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FirstWelcome(),
              ),
            );
          },
        );
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
