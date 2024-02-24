import 'package:aronnax/src/Pages/Formulary/professionalForm/professional_form.dart';
import 'package:flutter/material.dart';

class ProfessionalView extends StatelessWidget {
  const ProfessionalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          const SizedBox(
            height: 500,
            child: ProfessionalForm(),
          ),
          Container(),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Volver"),
          )
        ],
      ),
    );
  }
}
