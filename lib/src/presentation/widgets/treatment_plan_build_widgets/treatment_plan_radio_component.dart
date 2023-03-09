import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';
import 'package:flutter/material.dart';

class TreatmentPlanScaleComponent extends StatefulWidget {
  const TreatmentPlanScaleComponent({
    Key? key,
    required this.valuesList,
    required this.isHorizontal,
    required this.title,
    this.description,
  }) : super(key: key);
  final String title;
  final String? description;
  final List<TreatmentPlanOption> valuesList;
  final bool isHorizontal;

  @override
  State<TreatmentPlanScaleComponent> createState() =>
      _TreatmentPlanScaleComponentState();
}

class _TreatmentPlanScaleComponentState
    extends State<TreatmentPlanScaleComponent> {
  dynamic selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        Visibility(
          visible: widget.description != null,
          child: Text(widget.description ?? ''),
        ),
        ListView.builder(
          itemCount: widget.valuesList.length,
          scrollDirection:
              widget.isHorizontal ? Axis.horizontal : Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) => Radio(
            value: widget.valuesList[index],
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
