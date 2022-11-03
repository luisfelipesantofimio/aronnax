import 'dart:developer';

import 'package:aronnax/main.dart';
import 'package:aronnax/src/database/settings_model.dart';
import 'package:aronnax/src/providers/global_providers.dart';
import 'package:aronnax/src/themes/custom_themes.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalDBActivationScreen extends ConsumerStatefulWidget {
  const LocalDBActivationScreen({Key? key}) : super(key: key);

  @override
  LocalDBActivationScreenState createState() => LocalDBActivationScreenState();
}

class LocalDBActivationScreenState
    extends ConsumerState<LocalDBActivationScreen> {
  @override
  Widget build(BuildContext context) {
    bool isOfflineEnabled = ref.watch(globalOfflineStatusProvider);
    LocalDatabaseMode currentLocalDBstatus = offlineModeDB.get("offlineModeDB");
    isOfflineEnabled = currentLocalDBstatus.offlineModeEnabled;

    log(isOfflineEnabled.toString());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "¿Activar base de datos local?",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Column(
            children: [
              Switch(
                value: isOfflineEnabled,
                onChanged: (switchVal) {
                  ref
                      .read(globalOfflineStatusProvider.notifier)
                      .updateCurrentStatus();
                },
                activeColor: Colors.blueGrey,
                activeTrackColor: Colors.green,
              ),
              Text(
                isOfflineEnabled
                    ? "Aronnax está funcionando offline"
                    : "Aronnax está conectado a tu base de datos",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
