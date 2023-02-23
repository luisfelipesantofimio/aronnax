class RemoteProfessional {
  final int personalID;
  final String names;
  final String lastNames;

  final String countryCode;

  final int professionalID;
  final String userName;
  final String password;
  RemoteProfessional({
    required this.personalID,
    required this.names,
    required this.lastNames,
    required this.countryCode,
    required this.professionalID,
    required this.userName,
    required this.password,
  });
  factory RemoteProfessional.fromJson(Map<String, dynamic> data) {
    final personalID = data["personalID"] as int?;
    final names = data["names"] as String?;
    final lastNames = data["lastNames"] as String?;
    final countryCode = data["countryCode"] as String?;
    final professionalID = data["professionalID"] as int?;
    final userName = data["userName"] as String?;
    final password = data["password"] as String?;
    return RemoteProfessional(
        personalID: personalID!,
        names: names!,
        lastNames: lastNames!,
        countryCode: countryCode!,
        professionalID: professionalID!,
        userName: userName!,
        password: password!);
  }
}
