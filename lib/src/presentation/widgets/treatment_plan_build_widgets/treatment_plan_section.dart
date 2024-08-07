import 'package:flutter/material.dart';

class TreatmentPlanSection extends StatelessWidget {
  const TreatmentPlanSection({
    super.key,
    required this.title,
    required this.description,
    required this.componentsList,
  });
  final String title;
  final String description;
  final List<Widget> componentsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text(description),
        ListView.builder(
          shrinkWrap: true,
          itemCount: componentsList.length,
          itemBuilder: (context, index) => componentsList[index],
        ),
      ],
    );
  }
}
