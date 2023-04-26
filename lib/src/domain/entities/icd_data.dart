import 'dart:convert';

class IcdDataParser {
  final String title;
  final String icdRelease;
  final String? definition;
  final List<IcdDataCategory> child;
  IcdDataParser({
    required this.title,
    required this.icdRelease,
    this.definition,
    required this.child,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'definition': definition,
      'child': child.map((e) => e.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}

class IcdDataChild {
  final String title;
  final String? definition;
  final List? child;

  IcdDataChild({
    required this.title,
    this.definition,
    this.child,
  });

  factory IcdDataChild.fromMap(Map<String, dynamic> map) {
    final child = map['child'] as List?;
    final title = map['title'] as Map<String, dynamic>;
    final definition = map['definition'] as Map<String, dynamic>?;
    return IcdDataChild(
      title: title['@value'],
      definition: definition == null ? null : definition['@value'],
      child: child,
    );
  }

  factory IcdDataChild.fromJson(String source) =>
      IcdDataChild.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'IcdDataChild(title: $title, definition: $definition, child: $child)';
}

///Base data class used to store all required data for diagnostic information obtained from the ICD.
class IcdDataCategory {
  final String title;
  final String code;
  final String groupName;
  final String? definition;
  IcdDataCategory({
    required this.title,
    required this.code,
    required this.groupName,
    required this.definition,
  });

  factory IcdDataCategory.fromMap(Map<String, dynamic> map) {
    final code = map['code'] as String;
    final title = map['title'] as Map<String, dynamic>;
    final definition = map['definition'] as Map<String, dynamic>?;
    return IcdDataCategory(
      title: title['@value'],
      code: code,
      groupName: '',
      definition: definition == null ? null : definition['@value'],
    );
  }

  factory IcdDataCategory.fromLocalModel(Map<String, dynamic> map) {
    final code = map['code'] as String;
    final title = map['title'] as String;
    final groupName = map['groupName'] as String;
    final definition = map['definition'] as String?;
    return IcdDataCategory(
      title: title,
      code: code,
      groupName: groupName,
      definition: definition,
    );
  }

  factory IcdDataCategory.fromJson(String source) =>
      IcdDataCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'code': code,
      'groupName': groupName,
      'definition': definition,
    };
  }

  String toJson() => json.encode(toMap());

  IcdDataCategory copyWith({
    String? title,
    String? code,
    String? groupName,
    String? definition,
  }) {
    return IcdDataCategory(
      title: title ?? this.title,
      code: code ?? this.code,
      groupName: groupName ?? this.groupName,
      definition: definition ?? this.definition,
    );
  }

  @override
  String toString() {
    return 'IcdDataCategory(title: $title, code: $code, groupName: $groupName, definition: $definition)';
  }
}
