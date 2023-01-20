import 'package:aronnax/src/Pages/Formulary/professionalForm/local_professional_register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalProfessionalRegisterView extends ConsumerWidget {
  const LocalProfessionalRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 30 / 100,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 196, 244, 248),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    4,
                    0,
                  ),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Crear cuenta local",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(
                        10,
                      ),
                    ),
                    const Text(
                        "Recuerda, tus datos permanecerán guardados en la carpeta de documentos de tu equipo, mantén copias de seguridad constantes del archivo 'aronnax_localDB.sqlite'. Cualquier daño o pérdida hará de tus datos irrecuperables."),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 90 / 100,
            width: MediaQuery.of(context).size.width * 70 / 100,
            child: const LocalProfessionalRegister(),
          )
        ],
      ),
    );
  }
}
