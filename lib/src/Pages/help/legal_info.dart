import 'package:aronnax/src/presentation/core/constants.dart';
import 'package:flutter/material.dart';

class LegalInfo extends StatelessWidget {
  const LegalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const LicensePage(
      applicationIcon: Image(
        image: AssetImage("assets/img/aronnax-icon-dark.png"),
      ),
      applicationName: "Aronnax",
      applicationLegalese: "GPL v3",
      applicationVersion: AppConstants.globalVersion,
    );
  }
}
