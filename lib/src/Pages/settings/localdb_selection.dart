import 'dart:developer';

import 'package:aronnax/main.dart';
import 'package:aronnax/src/Pages/settings/widgets/no_server_dialog.dart';
import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/database/local_model/local_queries.dart';
import 'package:aronnax/src/data/database/settings_model.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';

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
                onChanged: (switchVal) async {
                  List<ProfessionalData> currentLocalUserList =
                      await localDB.isProfessionalsListEmpty();
                  if (isOfflineEnabled && localdb.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => const NoServerDialog(),
                    );
                  } else if (localdb.isNotEmpty &&
                      currentLocalUserList.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => const NoLocalDBConfiguredDialog(),
                    );
                  } else {
                    ref
                        .read(globalOfflineStatusProvider.notifier)
                        .updateCurrentStatus();
                  }
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
