import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';
import 'package:flutter/material.dart';

class ResultTextItem extends StatelessWidget {
  const ResultTextItem({
    Key? key,
    required this.resultData,
  }) : super(key: key);
  final TreatmentPlanResultValue resultData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          resultData.componentTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(resultData.value),
      ],
    );
  }
}
