import 'package:flutter/material.dart';

class TreatmentPlanMetadataForm extends StatefulWidget {
  const TreatmentPlanMetadataForm({Key? key}) : super(key: key);

  @override
  State<TreatmentPlanMetadataForm> createState() =>
      _TreatmentPlanMetadataFormState();
}

class _TreatmentPlanMetadataFormState extends State<TreatmentPlanMetadataForm> {
  final treatmentPlanMetadataFormKey = GlobalKey<FormState>();

  String titleValue = 'Your title';
  String description = "What's this treatment plan about?";

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            initialValue: titleValue,
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'Your title',
            ),
            style: TextStyle(fontSize: 30),
            validator: (value) {
              if (value!.isEmpty) {
                setState(() {
                  titleValue = 'Your title';
                });
              }
            },
            onChanged: (value) {
              setState(() {
                titleValue = value;
              });
              treatmentPlanMetadataFormKey.currentState!.validate();
            },
          ),
          TextFormField(
            maxLines: 5,
            initialValue: description,
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'Treatment plan description',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                setState(() {
                  description = "What's this treatment plan about?";
                });
              }
            },
            onChanged: (value) {
              setState(() {
                description = value;
              });
              treatmentPlanMetadataFormKey.currentState!.validate();
            },
          ),
        ],
      ),
    );
  }
}
