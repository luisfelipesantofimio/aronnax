import 'package:aronnax/src/domain/entities/treatment_plan_entities/treatment_plan_component.dart';

class ListComponent extends TreatmentPlanComponent {
  final bool isHorizontal;
  final List<TreatmentPlanComponent> components;

  ListComponent({
    required String componentTitle,
    required String? componentDescription,
    required String componentType,
    required bool isRequired,
    required this.isHorizontal,
    required this.components,
  }) : super(
          componentTitle: componentTitle,
          componentDescription: componentDescription,
          componentType: componentType,
          isRequired: isRequired,
        );

  @override
  Map<String, dynamic> toJson() => {
        'componentTitle': componentTitle,
        'componentDescription': componentDescription,
        'isRequired': isRequired,
        'componentType': componentType,
        'isHorizontal': isHorizontal,
        'components': components,
      };

  factory ListComponent.fromJson(Map<String, dynamic> data) {
    final componentTitle = data['componentTitle'] as String;
    final componentDescription = data['componentDescription'] as String?;
    final componentType = data['componentType'] as String;
    final isRequired = data['componentType'] as bool;
    final isHorizontal = data['isHorizontal'] as bool;
    final components = data['components'] as List<TreatmentPlanComponent>;
    return ListComponent(
      componentTitle: componentTitle,
      componentDescription: componentDescription,
      componentType: componentType,
      isRequired: isRequired,
      isHorizontal: isHorizontal,
      components: components,
    );
  }
}
