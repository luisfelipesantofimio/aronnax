import 'dart:convert';

class TreatmentPlanOption<T> {
  final T value;
  final String optionName;
  TreatmentPlanOption({
    required this.value,
    required this.optionName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'optionName': optionName,
    };
  }

  factory TreatmentPlanOption.fromMap(Map<String, dynamic> map) {
    return TreatmentPlanOption(
      value: map['value'] as dynamic,
      optionName: map['optionName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TreatmentPlanOption.fromJson(String source) =>
      TreatmentPlanOption.fromMap(json.decode(source) as Map<String, dynamic>);
}
