import 'package:aronnax/src/presentation/professional_register/local_professional_register_view.dart';
import 'package:aronnax/src/presentation/welcome_screens/create_server.dart';
import 'package:aronnax/src/presentation/welcome_screens/server_config.dart';
import 'package:flutter/material.dart';

class NoServerDialog extends StatelessWidget {
  const NoServerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Parece que no tienes un servidor configurado",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ServerCreate(),
                        ));
                  },
                  child: const Text("Crear nueva base de datos"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ServerConfig(),
                        ));
                  },
                  child: const Text("Configurar servidor existente"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NoLocalDBConfiguredDialog extends StatelessWidget {
  const NoLocalDBConfiguredDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "No has configurado una base de datos local",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocalProfessionalRegisterView(),
                  ),
                );
              },
              child: const Text(
                "Vamos",
              ),
            )
          ],
        ),
      ),
    );
  }
}
