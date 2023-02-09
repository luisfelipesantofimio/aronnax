import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/settings_repository_interface.dart';
import 'package:aronnax/src/data/providers/settings_provider.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings_headerbar.dart';

class SettingsMain extends ConsumerWidget {
  const SettingsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsStream = ref.watch(settingsStreamProvider);

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SettingsHeaderBar(),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: currentView,
              builder: (BuildContext context, value, child) {
                return Center(
                  child: SizedBox(
                    height: double.maxFinite,
                    width: 1000,
                    child: AppMethods()
                        .settingsScreenIndex(currentView, settingsStream),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
