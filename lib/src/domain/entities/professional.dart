import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/domain/entities/remote_model/remote_professional.dart';

class Professional {
  final int personalID;
  final String lastNames;
  final String countryCode;
  final int professionalID;
  final String userName;
  final String password;
  Professional({
    required this.personalID,
    required this.lastNames,
    required this.countryCode,
    required this.professionalID,
    required this.userName,
    required this.password,
  });

  factory Professional.fromLocalModel(LocalProfessionalData data) {
    return Professional(
      personalID: data.personalID,
      lastNames: data.lastNames,
      countryCode: data.countryCode,
      professionalID: data.professionalID,
      userName: data.userName,
      password: data.password,
    );
  }
  factory Professional.fromRemoteModel(RemoteProfessional data) {
    return Professional(
      personalID: data.personalID,
      lastNames: data.lastNames,
      countryCode: data.countryCode,
      professionalID: data.professionalID,
      userName: data.userName,
      password: data.password,
    );
  }
}
