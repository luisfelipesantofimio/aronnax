import 'package:aronnax/src/domain/entities/treatment_plan_entities/treatment_plan_component.dart';

class RadioButtonComponent extends TreatmentPlanComponent {
  final dynamic value;
  final dynamic groupValue;

  RadioButtonComponent({
    required String componentTitle,
    required String? componentDescription,
    required String componentType,
    required bool isRequired,
    required this.value,
    required this.groupValue,
  }) : super(
            componentTitle: componentTitle,
            componentDescription: componentDescription,
            componentType: componentType,
            isRequired: isRequired);

  @override
  Map<String, dynamic> toJson() => {
        'componentTitle': componentTitle,
        'componentDescription': componentDescription,
        'isRequired': isRequired,
        'componentType': componentType,
        'value': value,
        'groupValue': groupValue,
      };

  factory RadioButtonComponent.fromJson(Map<String, dynamic> data) {
    final componentTitle = data['componentTitle'] as String;
    final componentDescription = data['componentDescription'] as String;
    final componentType = data['componentType'] as String;
    final isRequired = data['isRequired'] as bool;
    final value = data['value'];
    final groupValue = data['groupValue'];
    return RadioButtonComponent(
      componentTitle: componentTitle,
      componentDescription: componentDescription,
      componentType: componentType,
      isRequired: isRequired,
      value: value,
      groupValue: groupValue,
    );
  }
}
