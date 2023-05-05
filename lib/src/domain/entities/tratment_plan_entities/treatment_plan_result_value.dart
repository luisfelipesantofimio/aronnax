import 'dart:convert';

class TreatmentPlanResultValue {
  final int componentId;
  final int treatmentPhase;
  final bool messurable;
  final String componentType;
  final String componentTitle;
  final int? optionsSize;
  final String? alias;
  final dynamic value;
  TreatmentPlanResultValue({
    required this.componentId,
    required this.treatmentPhase,
    required this.componentTitle,
    required this.messurable,
    required this.componentType,
    this.optionsSize,
    this.alias,
    required this.value,
  });

  TreatmentPlanResultValue copyWith({
    int? componentId,
    int? treatmentPhase,
    bool? messurable,
    String? componentType,
    String? componentTitle,
    int? optionsSize,
    String? alias,
    dynamic? value,
  }) {
    return TreatmentPlanResultValue(
      componentId: componentId ?? this.componentId,
      treatmentPhase: treatmentPhase ?? this.treatmentPhase,
      messurable: messurable ?? this.messurable,
      componentType: componentType ?? this.componentType,
      componentTitle: componentTitle ?? this.componentTitle,
      optionsSize: optionsSize ?? this.optionsSize,
      alias: alias ?? this.alias,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'componentId': componentId,
      'treatmentPhase': treatmentPhase,
      'componentTitle': componentTitle,
      'messurable': messurable,
      'componentType': componentType,
      'optionsSize': optionsSize,
      'alias': alias,
      'value': value,
    };
  }

  factory TreatmentPlanResultValue.fromMap(Map<String, dynamic> map) {
    return TreatmentPlanResultValue(
      componentId: map['componentId'] as int,
      treatmentPhase: map['treatmentPhase'] as int,
      messurable: map['messurable'] as bool,
      componentTitle: map['componentTitle'],
      componentType: map['componentType'],
      optionsSize: map['optionsSize'],
      alias: map['alias'],
      value: map['value'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory TreatmentPlanResultValue.fromJson(String source) =>
      TreatmentPlanResultValue.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TreatmentPlanResultValue(componentId: $componentId, treatmentPhase: $treatmentPhase, messurable: $messurable, componentType: $componentType, componentTitle: $componentTitle, optionsSize: $optionsSize, alias: $alias, value: $value)';
  }

  @override
  bool operator ==(covariant TreatmentPlanResultValue other) {
    if (identical(this, other)) return true;

    return other.componentId == componentId &&
        other.treatmentPhase == treatmentPhase &&
        other.messurable == messurable &&
        other.componentType == componentType &&
        other.optionsSize == optionsSize &&
        other.alias == alias &&
        other.value == value;
  }

  @override
  int get hashCode {
    return componentId.hashCode ^
        treatmentPhase.hashCode ^
        messurable.hashCode ^
        componentType.hashCode ^
        optionsSize.hashCode ^
        alias.hashCode ^
        value.hashCode;
  }
}
