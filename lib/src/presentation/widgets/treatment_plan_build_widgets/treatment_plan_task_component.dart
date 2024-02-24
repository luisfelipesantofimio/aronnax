import 'dart:developer';

import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreatmentPlanTaskComponent extends ConsumerStatefulWidget {
  const TreatmentPlanTaskComponent({
    super.key,
    required this.componentData,
  });
  final TreatmentPlanComponent componentData;

  @override
  ConsumerState<TreatmentPlanTaskComponent> createState() =>
      _TreatmentPlanTaskComponentState();
}

class _TreatmentPlanTaskComponentState
    extends ConsumerState<TreatmentPlanTaskComponent> {
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.componentData.componentTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(widget.componentData.componentDescription),
        Row(
          children: [
            Switch(
              value: isComplete,
              onChanged: (value) {
                setState(() {
                  isComplete = !isComplete;
                });
                final updatedResultsList =
                    ref.read(currentTreatmentPlanResponseListProvider);

                final itemIndex = updatedResultsList.indexWhere((element) =>
                    element.componentId == widget.componentData.id);

                if (itemIndex != -1) {
                  final updatedData = TreatmentPlanResultValue(
                      componentTitle: widget.componentData.componentTitle,
                      componentType: 'task',
                      treatmentPhase: widget.componentData.treatmentPlanPhase,
                      componentId: widget.componentData.id!,
                      messurable: widget.componentData.messurable,
                      value: isComplete);

                  updatedResultsList[itemIndex] = updatedData;
                } else {
                  final newData = TreatmentPlanResultValue(
                      componentTitle: widget.componentData.componentTitle,
                      componentType: 'task',
                      treatmentPhase: widget.componentData.treatmentPlanPhase,
                      componentId: widget.componentData.id!,
                      messurable: widget.componentData.messurable,
                      value: isComplete);
                  updatedResultsList.add(newData);
                }

                ref
                    .read(currentTreatmentPlanResponseListProvider.notifier)
                    .update((state) => state = updatedResultsList);
                log(updatedResultsList.toString());
                treatmentPlanApplicationFormKey.currentState?.validate();
              },
            ),
            Text(isComplete ? 'Done' : 'Pending'),
          ],
        ),
      ],
    );
  }
}
