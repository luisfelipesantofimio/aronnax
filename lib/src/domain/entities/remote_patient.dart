// class implemented on remote SQL data fetching for patients

class RemotePatient {
  final String names;
  final String lastNames;
  final String birthDate;
  final int idNumber;
  final String contactNumber;
  final String mail;
  final String city;
  final String state;
  final String adress;
  final String education;
  final String ocupation;
  final String insurance;
  final String emergencyContactName;
  final String emergencyContactNumber;

  RemotePatient(
      {required this.names,
      required this.lastNames,
      required this.birthDate,
      required this.idNumber,
      required this.contactNumber,
      required this.mail,
      required this.city,
      required this.state,
      required this.adress,
      required this.education,
      required this.ocupation,
      required this.insurance,
      required this.emergencyContactName,
      required this.emergencyContactNumber});

  factory RemotePatient.fromJson(Map<String, dynamic> data) {
    final names = data["names"] as String?;
    final lastNames = data["lastNames"] as String?;
    final birthDate = data["birthDate"] as String?;
    final idNumber = data["idNumber"] as int?;
    final contactNumber = data["contactNumber"] as String?;
    final mail = data["mail"] as String?;
    final city = data["city"] as String?;
    final state = data["state"] as String?;
    final adress = data["adress"] as String?;
    final education = data["education"] as String?;
    final ocupation = data["ocupation"] as String?;
    final insurance = data["insurance"] as String?;
    final emergencyContactName = data["emergencyContactName"] as String?;
    final emergencyContactNumber = data["emergencyContactNumber"] as String?;
    return RemotePatient(
        names: names!,
        lastNames: lastNames!,
        birthDate: birthDate!,
        idNumber: idNumber!,
        contactNumber: contactNumber!,
        mail: mail!,
        city: city!,
        state: state!,
        adress: adress!,
        education: education!,
        ocupation: ocupation!,
        insurance: insurance!,
        emergencyContactName: emergencyContactName!,
        emergencyContactNumber: emergencyContactNumber!);
  }
}
