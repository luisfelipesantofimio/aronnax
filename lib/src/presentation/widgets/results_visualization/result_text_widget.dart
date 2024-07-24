import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';
import 'package:flutter/material.dart';

class ResultTextItem extends StatelessWidget {
  const ResultTextItem({
    super.key,
    required this.resultData,
  });
  final TreatmentPlanResultValue resultData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            resultData.componentTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(resultData.value ?? 'No data')),
      ],
    );
  }
}
