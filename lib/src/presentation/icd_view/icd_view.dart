import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/icd_data_provider.dart';
import 'package:aronnax/src/presentation/welcome_screens/finish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IcdView extends ConsumerWidget {
  const IcdView({
    Key? key,
    required this.isConfigured,
  }) : super(key: key);
  final bool isConfigured;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icdData = ref.watch(icdDataProvider(
        "https://id.who.int/icd/release/11/2023-01/mms/334423054"));

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icdData.when(
            skipLoadingOnRefresh: false,
            data: (data) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '¡Todo listo!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                const Icon(
                  FontAwesomeIcons.laptopMedical,
                  size: 50,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                const Text('Ya tienes una copia del CIE-11 a tu disposición.'),
                const Padding(
                  padding: EdgeInsets.all(20),
                ),
                TextButton(
                  onPressed: () => isConfigured
                      ? Navigator.pop(context)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FinishConfig(),
                          ),
                        ),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            error: (error, stackTrace) => Column(
              children: [
                Text('Error $error'),
                Text(stackTrace.toString()),
                TextButton(
                  onPressed: () => {
                    ref
                        .read(localDatabaseRepositoryProvider)
                        .deleteSavedIcdData(),
                    ref.invalidate(icdDataProvider),
                  },
                  child: const Text("Try again"),
                ),
              ],
            ),
            loading: () => SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Column(
                children: [
                  Text(
                    '¡Sé paciente!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(
                      'Aronnax está haciendo una copia local de la Clasificación Internacional de Enfermedades, 11a revisión (CIE-11), usando la API de la OMS para dar soporte en tus impresiones diagnósticas. Esto puede llevar varios minutos.'),
                  CircularProgressIndicator()
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
