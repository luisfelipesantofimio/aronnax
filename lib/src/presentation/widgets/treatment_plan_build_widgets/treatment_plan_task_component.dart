import 'package:flutter/material.dart';

class TreatmentPlanTaskComponent extends StatefulWidget {
  const TreatmentPlanTaskComponent({
    Key? key,
    required this.title,
    required this.description,
    required this.isRequired,
    required this.isMessurable,
  }) : super(key: key);
  final String title;
  final String description;
  final bool isRequired;
  final bool isMessurable;

  @override
  State<TreatmentPlanTaskComponent> createState() =>
      _TreatmentPlanTaskComponentState();
}

class _TreatmentPlanTaskComponentState
    extends State<TreatmentPlanTaskComponent> {
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(widget.description),
        Row(
          children: [
            Switch(
              value: isComplete,
              onChanged: (value) {
                setState(() {
                  isComplete = !isComplete;
                });
              },
            ),
            Text(isComplete ? 'Done' : 'Pending'),
          ],
        ),
      ],
    );
  }
}
