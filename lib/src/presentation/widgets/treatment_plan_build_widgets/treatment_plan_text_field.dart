import 'dart:developer';

import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result.dart';
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
  void initState() {
    if (ref.read(currentTreatmentPlanResponseListProvider).isEmpty) {
      TreatmentPlanResultValue data = TreatmentPlanResultValue(
          componentId: widget.componentData.id!,
          messurable: widget.componentData.messurable,
          value: null);

      ref.read(currentTreatmentPlanResponseListProvider).add(data);
    }

    super.initState();
  }

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
            // initialValue: ref.read(currentTreatmentPlanResponseProvider) != null
            //     ? ref
            //         .read(currentTreatmentPlanResponseProvider)!
            //         .results
            //         .elementAt(ref
            //             .read(currentTreatmentPlanResponseProvider)!
            //             .results
            //             .indexWhere((element) =>
            //                 element.componentId == widget.componentData.id))
            //         .value
            //     : null,
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
              TreatmentPlanResultValue data = TreatmentPlanResultValue(
                  componentId: widget.componentData.id!,
                  messurable: widget.componentData.messurable,
                  value: value);
              if (ref
                      .read(currentTreatmentPlanResponseListProvider)
                      .isNotEmpty &&
                  ref.read(currentTreatmentPlanResponseListProvider).contains(
                      ref
                          .read(currentTreatmentPlanResponseListProvider)
                          .elementAt(ref
                              .read(currentTreatmentPlanResponseListProvider)
                              .indexWhere((element) =>
                                  element.componentId ==
                                  widget.componentData.id)))) {
                TreatmentPlanResultValue newValue = ref
                    .read(currentTreatmentPlanResponseListProvider)
                    .elementAt(ref
                        .read(currentTreatmentPlanResponseListProvider)
                        .indexWhere((element) =>
                            element.componentId == widget.componentData.id))
                    .copyWith(value: data.value);
                int itemIndex = ref
                    .read(currentTreatmentPlanResponseListProvider)
                    .indexWhere((element) =>
                        element.componentId == widget.componentData.id);
                ref
                    .read(currentTreatmentPlanResponseListProvider)
                    .removeAt(itemIndex);
                ref
                    .read(currentTreatmentPlanResponseListProvider)
                    .insert(itemIndex, newValue);
              } else {
                TreatmentPlanResultValue data = TreatmentPlanResultValue(
                    componentId: widget.componentData.id!,
                    messurable: widget.componentData.messurable,
                    value: value);

                ref.read(currentTreatmentPlanResponseListProvider).add(data);
              }

              treatmentPlanApplicationFormKey.currentState?.validate();
            }),
      ],
    );
  }
}
