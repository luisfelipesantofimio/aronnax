///Representation of an ICD entity
class IcdData {
  String title;
  String? definition;
  String blockType;
  String? browserURL;
  String? code;
  List<IcdData> children;
  IcdData({
    required this.title,
    this.definition,
    required this.blockType,
    this.browserURL,
    this.code,
    required this.children,
  });

  factory IcdData.fromJson(Map<String, dynamic> json) {
    return IcdData(
      title: json['title']['@value'],
      definition:
          json['definition'] == null ? null : json['definition']['@value'],
      blockType: json['classKind'],
      browserURL: json['browserUrl'],
      code: json['code'],
      children: json['Children'] == null
          ? []
          : List<IcdData>.from(
              json['Children'].map((x) => IcdData.fromJson(x))),
    );
  }

  // TODO: Create method for sorting classKind by object depth
}
