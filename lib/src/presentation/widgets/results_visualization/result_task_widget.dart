import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';
import 'package:flutter/material.dart';

class ResultTaskItem extends StatelessWidget {
  const ResultTaskItem({
    Key? key,
    required this.resultData,
  }) : super(key: key);
  final TreatmentPlanResultValue resultData;

  @override
  Widget build(BuildContext context) {
    bool? result = resultData.value as bool;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.19,
          child: Text(
            resultData.componentTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        result
            ? const Icon(
                Icons.check,
                color: Colors.green,
              )
            : const Icon(
                Icons.close,
                color: Colors.red,
              ),
      ],
    );
  }
}
