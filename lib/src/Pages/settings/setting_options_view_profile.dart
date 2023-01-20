import 'package:aronnax/src/Pages/settings/configOptions/update_password.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsOptionsProfile extends ConsumerWidget {
  const SettingsOptionsProfile({Key? key}) : super(key: key);

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
                "${ref.read(globalUserNameProvider)}  ${ref.read(globalUserLastNameProvider)}",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                  "Tarjeta profesional: ${ref.read(globalProfessionalIDProvider)}"),
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
