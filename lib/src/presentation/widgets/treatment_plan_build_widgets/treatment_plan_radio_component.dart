import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:flutter/material.dart';

class TreatmentPlanScaleComponent extends StatefulWidget {
  const TreatmentPlanScaleComponent({
    Key? key,
    required this.valuesList,
    required this.title,
    this.description,
    required this.isRequired,
    required this.isMessurable,
  }) : super(key: key);
  final String title;
  final String? description;
  final List<TreatmentPlanOption> valuesList;
  final bool isRequired;
  final bool isMessurable;

  @override
  State<TreatmentPlanScaleComponent> createState() =>
      _TreatmentPlanScaleComponentState();
}

class _TreatmentPlanScaleComponentState
    extends State<TreatmentPlanScaleComponent> {
  dynamic selectedValue;
  String? errorMessage;
  bool isErrorVisible = false;

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (field) => Column(
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
              scrollDirection: Axis.horizontal,
              itemCount: widget.valuesList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => SizedBox(
                width: 100,
                child: RadioListTile(
                  title: Text(widget.valuesList[index].optionName),
                  value: widget.valuesList[index],
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                      treatmentPlanApplicationFormKey.currentState?.validate();
                    });
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: isErrorVisible,
            child: Text(
              errorMessage ?? '',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      validator: widget.isRequired
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
            }
          : null,
    );
  }
}
