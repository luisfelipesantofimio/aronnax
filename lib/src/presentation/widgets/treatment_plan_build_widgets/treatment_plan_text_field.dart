import 'dart:developer';

import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreatmentPlanTextField extends ConsumerStatefulWidget {
  const TreatmentPlanTextField({
    Key? key,
    required this.componentData,
  }) : super(key: key);
  final TreatmentPlanComponent componentData;

  @override
  ConsumerState<TreatmentPlanTextField> createState() =>
      _TreatmentPlanTextFieldState();
}

class _TreatmentPlanTextFieldState
    extends ConsumerState<TreatmentPlanTextField> {
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
        TextFormField(
            decoration: InputDecoration(
              hintText: widget.componentData.componentTitle,
            ),
            validator: widget.componentData.isRequired
                ? (value) {
                    if (value!.isEmpty) {
                      return 'The field must not be empty';
                    }

                    return null;
                  }
                : null,
            onChanged: (value) {
              final updatedResultsList =
                  ref.read(currentTreatmentPlanResponseListProvider);

              final itemIndex = updatedResultsList.indexWhere(
                  (element) => element.componentId == widget.componentData.id);

              if (itemIndex != -1) {
                final updatedData = TreatmentPlanResultValue(
                    treatmentPhase: widget.componentData.treatmentPlanPhase,
                    componentId: widget.componentData.id!,
                    messurable: widget.componentData.messurable,
                    value: value);

                updatedResultsList[itemIndex] = updatedData;
              } else {
                final newData = TreatmentPlanResultValue(
                    treatmentPhase: widget.componentData.treatmentPlanPhase,
                    componentId: widget.componentData.id!,
                    messurable: widget.componentData.messurable,
                    value: value);
                updatedResultsList.add(newData);
              }

              ref
                  .read(currentTreatmentPlanResponseListProvider.notifier)
                  .update((state) => state = updatedResultsList);
              log(updatedResultsList.toString());
              treatmentPlanApplicationFormKey.currentState?.validate();
            }),
      ],
    );
  }
}
