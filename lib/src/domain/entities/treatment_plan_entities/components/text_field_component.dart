import 'package:aronnax/src/domain/entities/treatment_plan_entities/treatment_plan_component.dart';

class TextFieldComponent extends TreatmentPlanComponent {
  final int textFieldLenght;
  final String hintText;

  TextFieldComponent(
      {required this.textFieldLenght,
      required this.hintText,
      required String componentTitle,
      required String componentType,
      String? componentDescription,
      required bool isRequired})
      : super(
            componentType: componentType,
            componentTitle: componentTitle,
            isRequired: isRequired,
            componentDescription: componentDescription);

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['textFieldLenght'] = textFieldLenght;
    json['hintText'] = hintText;

    return json;
  }

  factory TextFieldComponent.fromJson(Map<String, dynamic> data) {
    final textFieldLenght = data['textFieldLenght'] as int;
    final componentTitle = data['componentTitle'] as String;
    final hintText = data['hintText'] as String;
    final componentDescription = data['componentDescription'] as String?;
    final componentType = data['componentType'] as String;

    final isRequired = data['isRequired'] as bool;

    return TextFieldComponent(
        componentDescription: componentDescription,
        textFieldLenght: textFieldLenght,
        hintText: hintText,
        componentTitle: componentTitle,
        componentType: componentType,
        isRequired: isRequired);
  }
}
