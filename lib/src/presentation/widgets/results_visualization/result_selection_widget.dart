import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';
import 'package:flutter/material.dart';

class ResultSelectionItem extends StatelessWidget {
  const ResultSelectionItem({
    Key? key,
    required this.resultData,
  }) : super(key: key);
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
        Text(resultData.value != null
            ? resultData.value.toString().split('-').join(' ')
            : 'Nothing was selected'),
      ],
    );
  }
}
