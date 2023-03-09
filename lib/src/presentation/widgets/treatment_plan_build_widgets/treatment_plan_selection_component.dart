import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';
import 'package:flutter/material.dart';

class TreatmentPlanSelectionComponent extends StatefulWidget {
  const TreatmentPlanSelectionComponent(
      {Key? key,
      required this.title,
      this.description,
      required this.valuesList,
      required this.isHorizontal})
      : super(key: key);
  final String title;
  final String? description;
  final List<TreatmentPlanOption> valuesList;
  final bool isHorizontal;

  @override
  State<TreatmentPlanSelectionComponent> createState() =>
      _TreatmentPlanSelectionComponentState();
}

class _TreatmentPlanSelectionComponentState
    extends State<TreatmentPlanSelectionComponent> {
  List<TreatmentPlanOption> selectedItems = [];

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
          itemBuilder: (context, index) => CheckboxListTile(
            value: selectedItems.contains(widget.valuesList[index].value),
            title: Text(widget.valuesList[index].optionName),
            onChanged: (value) {
              if (selectedItems.contains(widget.valuesList[index].value)) {
                selectedItems.removeAt(
                  selectedItems.indexWhere(
                    (element) => element == widget.valuesList[index],
                  ),
                );
              } else {
                selectedItems.add(
                  widget.valuesList[index],
                );
              }
            },
          ),
        )
      ],
    );
  }
}
