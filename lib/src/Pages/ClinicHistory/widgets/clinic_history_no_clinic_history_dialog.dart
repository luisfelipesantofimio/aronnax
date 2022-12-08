import 'package:flutter/material.dart';

class NoClinicHistoryDialog extends StatelessWidget {
  const NoClinicHistoryDialog({Key? key, required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 186, 230, 230),
      content: SizedBox(
        height: 300,
        width: 500,
        child: Column(
          children: const [
            Text("Espera"),
            Text("El usuario no tiene una historia clínica registrada."),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Volver"),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            "Crear historia clínica",
          ),
        ),
      ],
    );
  }
}
