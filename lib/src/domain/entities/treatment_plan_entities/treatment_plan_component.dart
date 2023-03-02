// ignore_for_file: public_member_api_docs, sort_constructors_first
///This class is an abstract representation of a widget and it's supposed to be
///use for encoding a decoding operations.
///
///This class requires a [componentType] for generating the required widget.
///The list of supported types are:
///
///- `textField`
///- `radio`
///- `checkbox`
///- `column`
///- `row`
///
///Each type is able to receive a list of [values] that can be `bool`, `string`
///or `int`.

class TreatmentPlanComponent {
  final String componentTitle;
  final String? componentDescription;
  final String componentType;
  final bool isRequired;

  TreatmentPlanComponent({
    required this.componentTitle,
    required this.componentDescription,
    required this.componentType,
    required this.isRequired,
  });

  Map<String, dynamic> toJson() => {
        'componentTitle': componentTitle,
        'componentDescription': componentDescription,
        'isRequired': isRequired,
        'componentType': componentType,
      };

  factory TreatmentPlanComponent.fromJson(Map<String, dynamic> data) {
    final componentTitle = data['componentTitle'] as String;
    final componentType = data['componentType'] as String;

    final componentDescription = ['componentDescription'] as String?;
    final isRequired = ['isRequired'] as bool;
    return TreatmentPlanComponent(
      componentType: componentType,
      componentTitle: componentTitle,
      componentDescription: componentDescription,
      isRequired: isRequired,
    );
  }
}
