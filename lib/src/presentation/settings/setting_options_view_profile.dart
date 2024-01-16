import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/presentation/settings/configOptions/update_password.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsOptionsProfile extends ConsumerWidget {
  const SettingsOptionsProfile({super.key, required this.settingsData});
  final AsyncValue<Setting> settingsData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${ref.read(globalUserInformationProvider)!.names}  ${ref.read(globalUserInformationProvider)!.lastNames}",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                  "Tarjeta profesional: ${ref.read(globalUserInformationProvider)!.professionalID}"),
              TextButton(
                child: const Text("Cambiar mi contraseña"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const UpdatePasswordDialog());
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
