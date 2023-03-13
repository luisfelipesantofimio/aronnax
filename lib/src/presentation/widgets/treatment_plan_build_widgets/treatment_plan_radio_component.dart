import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';
import 'package:flutter/material.dart';

class TreatmentPlanScaleComponent extends StatefulWidget {
  const TreatmentPlanScaleComponent({
    Key? key,
    required this.valuesList,
    required this.title,
    this.description,
    required this.isRequired,
  }) : super(key: key);
  final String title;
  final String? description;
  final List<TreatmentPlanOption> valuesList;
  final bool isRequired;

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
        SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width * 0.4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.valuesList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => SizedBox(
              width: 200,
              child: RadioListTile(
                title: Text(widget.valuesList[index].optionName),
                value: widget.valuesList[index],
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
