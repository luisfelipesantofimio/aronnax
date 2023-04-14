import 'dart:developer';

import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_result_value.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: improve components and find things to fix
class TreatmentPlanScaleComponent extends ConsumerStatefulWidget {
  const TreatmentPlanScaleComponent({
    Key? key,
    required this.componentData,
    required this.valuesList,
  }) : super(key: key);

  final List<TreatmentPlanOption> valuesList;
  final TreatmentPlanComponent componentData;

  @override
  ConsumerState<TreatmentPlanScaleComponent> createState() =>
      _TreatmentPlanScaleComponentState();
}

class _TreatmentPlanScaleComponentState
    extends ConsumerState<TreatmentPlanScaleComponent> {
  TreatmentPlanOption<dynamic>? selectedValue;
  String? errorMessage;
  bool isErrorVisible = false;

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.componentData.componentTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Visibility(
            visible: widget.componentData.componentDescription.isNotEmpty,
            child: Text(widget.componentData.componentTitle),
          ),
          SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.valuesList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => SizedBox(
                width: 100,
                child: RadioListTile(
                  title: Text(widget.valuesList[index].optionName),
                  value: widget.valuesList[index],
                  groupValue: selectedValue,
                  onChanged: (TreatmentPlanOption? option) {
                    setState(() {
                      selectedValue = option;
                    });
                    final updatedResultsList =
                        ref.read(currentTreatmentPlanResponseListProvider);

                    final itemIndex = updatedResultsList.indexWhere((element) =>
                        element.componentId == widget.componentData.id);

                    if (itemIndex != -1) {
                      final updatedData = TreatmentPlanResultValue(
                          treatmentPhase:
                              widget.componentData.treatmentPlanPhase,
                          componentId: widget.componentData.id!,
                          messurable: widget.componentData.messurable,
                          value: selectedValue!.value);

                      updatedResultsList[itemIndex] = updatedData;
                    } else {
                      final newData = TreatmentPlanResultValue(
                          treatmentPhase:
                              widget.componentData.treatmentPlanPhase,
                          componentId: widget.componentData.id!,
                          messurable: widget.componentData.messurable,
                          value: selectedValue!.value);
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
          ),
          Visibility(
            visible: isErrorVisible,
            child: Text(
              errorMessage ?? '',
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      validator: widget.componentData.isRequired
          ? (value) {
              if (selectedValue == null) {
                setState(() {
                  errorMessage = 'You must select a value';
                  isErrorVisible = true;
                });
              } else {
                setState(() {
                  errorMessage = null;
                  isErrorVisible = false;
                });
              }
              return null;
            }
          : null,
    );
  }
}
