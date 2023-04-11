import 'dart:developer';

import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreatmentPlanSelectionComponent extends ConsumerStatefulWidget {
  const TreatmentPlanSelectionComponent({
    Key? key,
    required this.componentData,
    required this.valuesList,
  }) : super(key: key);
  final TreatmentPlanComponent componentData;
  final List<TreatmentPlanOption> valuesList;

  @override
  ConsumerState<TreatmentPlanSelectionComponent> createState() =>
      _TreatmentPlanSelectionComponentState();
}

class _TreatmentPlanSelectionComponentState
    extends ConsumerState<TreatmentPlanSelectionComponent> {
  List<TreatmentPlanOption> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.componentData.componentTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(widget.componentData.componentDescription),
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
                  final updatedResultsList =
                      ref.read(currentTreatmentPlanResponseListProvider);

                  final itemIndex = updatedResultsList.indexWhere((element) =>
                      element.componentId == widget.componentData.id);

                  if (itemIndex != -1) {
                    final updatedData = TreatmentPlanResultValue(
                      treatmentPhase: widget.componentData.treatmentPlanPhase,
                      componentId: widget.componentData.id!,
                      messurable: widget.componentData.messurable,
                      value:
                          selectedItems.map((e) => e.value).toList().join(','),
                    );

                    updatedResultsList[itemIndex] = updatedData;
                  } else {
                    final newData = TreatmentPlanResultValue(
                      treatmentPhase: widget.componentData.treatmentPlanPhase,
                      componentId: widget.componentData.id!,
                      messurable: widget.componentData.messurable,
                      value:
                          selectedItems.map((e) => e.value).toList().join(','),
                    );
                    updatedResultsList.add(newData);
                  }

                  ref
                      .read(currentTreatmentPlanResponseListProvider.notifier)
                      .update((state) => state = updatedResultsList);
                  log(updatedResultsList.toString());
                  treatmentPlanApplicationFormKey.currentState?.validate();
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
