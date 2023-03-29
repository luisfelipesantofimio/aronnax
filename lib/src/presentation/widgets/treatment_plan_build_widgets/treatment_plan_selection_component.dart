import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';
import 'package:flutter/material.dart';

class TreatmentPlanSelectionComponent extends StatefulWidget {
  const TreatmentPlanSelectionComponent({
    Key? key,
    required this.title,
    this.description,
    required this.valuesList,
    required this.isRequired,
    required this.isMessurable,
  }) : super(key: key);
  final String title;
  final String? description;
  final List<TreatmentPlanOption> valuesList;
  final bool isRequired;
  final bool isMessurable;
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
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Visibility(
          visible: widget.description != null,
          child: Text(widget.description ?? ''),
        ),
        SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width * 0.5,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.valuesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SizedBox(
              width: 100,
              child: CheckboxListTile(
                value: selectedItems.contains(widget.valuesList[index]),
                title: Text(widget.valuesList[index].optionName),
                onChanged: (value) {
                  if (selectedItems.contains(widget.valuesList[index])) {
                    setState(() {
                      selectedItems.removeAt(
                        selectedItems.indexWhere(
                          (element) => element == widget.valuesList[index],
                        ),
                      );
                    });
                  } else {
                    setState(() {
                      selectedItems.add(
                        widget.valuesList[index],
                      );
                    });
                  }
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
