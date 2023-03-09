import 'package:flutter/material.dart';

class TreatmentPlanTextField extends StatelessWidget {
  const TreatmentPlanTextField(
      {Key? key,
      required this.fieldTitle,
      this.fieldDescription,
      required this.hintText,
      required this.maxLenght,
      required this.isRequired})
      : super(key: key);
  final String fieldTitle;
  final String? fieldDescription;
  final String hintText;
  final int maxLenght;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(fieldTitle),
        Visibility(
          visible: fieldDescription != null,
          child: Text(fieldDescription ?? ''),
        ),
        TextFormField(
          maxLines: maxLenght,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          validator: isRequired
              ? (value) {
                  if (value!.isEmpty) {
                    return 'The field must not be empty';
                  }
                }
              : null,
          onChanged: (value) {
            //TODO: design a provider or parser to manage individual values for result
            //management
          },
        ),
      ],
    );
  }
}
