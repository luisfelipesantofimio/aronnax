import 'package:aronnax/src/Pages/Consultations/main_consult/main_consultation_header.dart';
import 'package:flutter/material.dart';
import 'defined_consultation.dart';

class UserConsultation extends StatefulWidget {
  const UserConsultation({Key? key}) : super(key: key);

  @override
  State<UserConsultation> createState() => _UserConsultationState();
}

class _UserConsultationState extends State<UserConsultation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Expanded(
              child: HeaderConsultation(),
            ),
            Expanded(
              child: DefinedConsultation(),
            ),
          ],
        ),
      ),
    );
  }
}
