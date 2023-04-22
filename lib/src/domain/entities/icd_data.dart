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

  // factory IcdDataParser.fromMap(Map<String, dynamic> map) {
  //   return IcdDataParser(
  //     title: map['title'] as String,
  //     definition:
  //         map['definition'] != null ? map['definition'] as String : null,
  //     child: map['child'] != null
  //         ? List<IcdDataCategory>.from(
  //             (map['child'] as List<int>).map<IcdDataCategory?>(
  //               (x) => IcdDataCategory.fromMap(x as Map<String, dynamic>),
  //             ),
  //           )
  //         : null,
  //   );
  //}

  String toJson() => json.encode(toMap());

  // factory IcdDataParser.fromJson(String source) =>
  //     IcdDataParser.fromMap(json.decode(source) as Map<String, dynamic>);
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
}

class IcdDataCategory {
  final String title;
  final String code;
  final String? definition;
  IcdDataCategory({
    required this.title,
    required this.code,
    required this.definition,
  });

  factory IcdDataCategory.fromMap(Map<String, dynamic> map) {
    final code = map['code'] as String;
    final title = map['title'] as Map<String, dynamic>;
    final definition = map['definition'] as Map<String, dynamic>?;
    return IcdDataCategory(
      title: title['@value'],
      code: code,
      definition: definition == null ? null : definition['@value'],
    );
  }

  factory IcdDataCategory.fromLocalModel(Map<String, dynamic> map) {
    final code = map['code'] as String;
    final title = map['title'] as String;
    final definition = map['definition'] as String?;
    return IcdDataCategory(
      title: title,
      code: code,
      definition: definition,
    );
  }

  factory IcdDataCategory.fromJson(String source) =>
      IcdDataCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'code': code,
      'definition': definition,
    };
  }

  String toJson() => json.encode(toMap());
}
