import 'package:aronnax/src/presentation/themes/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ScreenInformationContainer extends StatelessWidget {
  const ScreenInformationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: const BoxDecoration(
        color: CustomLightColors.secondary,
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 6),
            blurRadius: 6,
            color: Color.fromARGB(255, 224, 224, 224),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.treatmentPlansInformationTitle),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Text(AppLocalizations.of(context)!.treatmentPlansInformationBody),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
