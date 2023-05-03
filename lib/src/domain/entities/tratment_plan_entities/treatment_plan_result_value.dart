import 'dart:convert';

class TreatmentPlanResultValue {
  final int componentId;
  final int treatmentPhase;
  final bool messurable;
  final String componentType;
  final dynamic value;
  TreatmentPlanResultValue({
    required this.componentId,
    required this.treatmentPhase,
    required this.messurable,
    required this.componentType,
    required this.value,
  });

  TreatmentPlanResultValue copyWith({
    int? componentId,
    int? treatmentPhase,
    String? componentType,
    bool? messurable,
    dynamic? value,
  }) {
    return TreatmentPlanResultValue(
      componentType: componentType ?? this.componentType,
      componentId: componentId ?? this.componentId,
      treatmentPhase: treatmentPhase ?? this.treatmentPhase,
      messurable: messurable ?? this.messurable,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'componentId': componentId,
      'treatmentPhase': treatmentPhase,
      'messurable': messurable,
      'componentType': componentType,
      'value': value,
    };
  }

  factory TreatmentPlanResultValue.fromMap(Map<String, dynamic> map) {
    return TreatmentPlanResultValue(
      componentId: map['componentId'] as int,
      treatmentPhase: map['treatmentPhase'] as int,
      messurable: map['messurable'] as bool,
      componentType: map['componentType'],
      value: map['value'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory TreatmentPlanResultValue.fromJson(String source) =>
      TreatmentPlanResultValue.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TreatmentPlanResultValue(componentId: $componentId, treatmentPhase: $treatmentPhase, messurable: $messurable, componentType: $componentType, value: $value)';
  }

  @override
  bool operator ==(covariant TreatmentPlanResultValue other) {
    if (identical(this, other)) return true;

    return other.componentId == componentId &&
        other.treatmentPhase == treatmentPhase &&
        other.messurable == messurable &&
        other.value == value;
  }

  @override
  int get hashCode {
    return componentId.hashCode ^
        treatmentPhase.hashCode ^
        messurable.hashCode ^
        value.hashCode;
  }
}
