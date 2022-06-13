import 'package:aronnax/src/Pages/LoginScreen/login_form.dart';
import 'package:aronnax/src/Pages/settings/configOptions/update_password.dart';
import 'package:flutter/material.dart';

class SettingsOptionsProfile extends StatefulWidget {
  const SettingsOptionsProfile({Key? key}) : super(key: key);

  @override
  State<SettingsOptionsProfile> createState() => _SettingsOptionsProfileState();
}

class _SettingsOptionsProfileState extends State<SettingsOptionsProfile> {
  @override
  Widget build(BuildContext context) {
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
                "$globalUserName  $globalUserLastNames",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text("Tarjeta profesional: $globalProfessionalID"),
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
