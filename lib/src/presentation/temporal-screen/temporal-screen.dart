import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class TemporalScreen extends StatefulWidget {
  const TemporalScreen({super.key});

  @override
  State<TemporalScreen> createState() => _TemporalScreenState();
}

class _TemporalScreenState extends State<TemporalScreen> {
  @override
  void initState() {
    Future(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(
        p.join(dbFolder.path, 'aronnax/aronnax_localDB.sqlite'),
      );
      await file.delete();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '¡Gracias por tu colaboración!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: const Text(
                  'Esta fase de prueba ha terminado y no es seguro continuar con el uso de esta versión. La base de datos ha sido borrada para evitar futuras incompatibilidades.'),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: const Text(
                  'Espera novedades a través del medio por el que encontraste esta versión de pruebas, hasta que la versión oficial sea lanzada.'),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            const Icon(
              FontAwesomeIcons.brain,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
