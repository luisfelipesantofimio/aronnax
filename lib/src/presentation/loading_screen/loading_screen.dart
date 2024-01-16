import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/settings_provider.dart';
import 'package:aronnax/src/presentation/login/login_main_view.dart';
import 'package:aronnax/src/presentation/welcome_screens/first.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final settingsStream = ref.watch(settingsStreamProvider);

    return Scaffold(
      body: settingsStream.when(
        data: (data) {
          Future(
            () => ref
                .read(globalOfflineStatusProvider.notifier)
                .update((state) => data.isDarkModeEnabled),
          );

          return data.isConfigured ? const LoginScreen() : const FirstWelcome();
        },
        error: (error, stackTrace) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Something went wrong :('),
              Text('$error'),
            ],
          ),
        ),
        loading: () => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
