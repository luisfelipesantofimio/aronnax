import 'package:flutter/material.dart';

import '../../misc/global_values.dart';

class LegalInfo extends StatelessWidget {
  const LegalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LicensePage(
      applicationIcon: const Image(
        image: AssetImage("assets/img/aronnax-icon-dark.png"),
      ),
      applicationName: "Aronnax",
      applicationLegalese: "GPL v3",
      applicationVersion: globalVersion,
    );
  }
}
