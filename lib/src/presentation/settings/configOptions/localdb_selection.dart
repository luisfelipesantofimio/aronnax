import 'dart:developer';

import 'package:aronnax/src/presentation/settings/widgets/no_server_dialog.dart';
import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/database/local_model/local_queries.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';

import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalDBActivationScreen extends ConsumerStatefulWidget {
  const LocalDBActivationScreen({Key? key, required this.settingsData})
      : super(key: key);
  final AsyncValue<Setting> settingsData;
  @override
  LocalDBActivationScreenState createState() => LocalDBActivationScreenState();
}

class LocalDBActivationScreenState
    extends ConsumerState<LocalDBActivationScreen> {
  @override
  Widget build(BuildContext context) {
    bool isOfflineEnabled = ref.watch(globalOfflineStatusProvider);

    return widget.settingsData.when(
      data: (data) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¿Activar base de datos local?",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Column(
              children: [
                Switch(
                  value: isOfflineEnabled,
                  onChanged: (switchVal) async {
                    List<ServerDatabaseData> serverConfigurations = await ref
                        .watch(localDatabaseRepositoryProvider)
                        .getServerConfigurationList();

                    List<ProfessionalData> professionalsList = await ref
                        .read(localDatabaseRepositoryProvider)
                        .getProfessionalsList();

                    if (isOfflineEnabled && serverConfigurations.isEmpty) {
                      Future(() => showDialog(
                            context: context,
                            builder: (context) => const NoServerDialog(),
                          ));
                    } else if (!isOfflineEnabled && professionalsList.isEmpty) {
                      Future(
                        () => showDialog(
                          context: context,
                          builder: (context) =>
                              const NoLocalDBConfiguredDialog(),
                        ),
                      );
                    } else {
                      Future(
                        () async {
                          ref
                              .read(localDatabaseRepositoryProvider)
                              .updateConnectionMode(!switchVal);
                        },
                      );
                    }
                  },
                  activeColor: Colors.blueGrey,
                  activeTrackColor: Colors.green,
                ),
                Text(
                  isOfflineEnabled
                      ? "Aronnax está funcionando offline"
                      : "Aronnax está conectado a tu base de datos",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => const Center(
        child: Text("Something went wrong"),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
