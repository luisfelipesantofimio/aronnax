import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
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
        if (await ref
                .read(localDatabaseRepositoryProvider)
                .verifySettingsData() ==
            null) {
          ref.read(localDatabaseRepositoryProvider).insertSettings(
              id: 0,
              darkModeEnabled: false,
              offlineEnabled: false,
              isConfigured: false);
        }
      },
    );

    Future(() async {
      Setting? settings =
          await ref.read(localDatabaseRepositoryProvider).verifySettingsData();
      if (settings!.isConfigured) {
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
