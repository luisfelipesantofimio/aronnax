// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/domain/entities/remote_model/remote_professional.dart';

class Professional {
  final String id;
  final int personalID;
  final String names;
  final String lastNames;
  final String countryCode;
  final String securityQuestion;
  final String encodedSecurityAnswer;
  final String encodedRecoverPin;
  final String adress;
  final String email;
  final int professionalID;
  final String userName;
  final String password;
  Professional({
    required this.id,
    required this.personalID,
    required this.names,
    required this.lastNames,
    required this.countryCode,
    required this.securityQuestion,
    required this.encodedSecurityAnswer,
    required this.encodedRecoverPin,
    required this.adress,
    required this.email,
    required this.professionalID,
    required this.userName,
    required this.password,
  });

  factory Professional.fromLocalModel(LocalProfessionalData data) {
    return Professional(
      id: data.id,
      personalID: data.personalID,
      names: data.names,
      lastNames: data.lastNames,
      countryCode: data.countryCode,
      professionalID: data.professionalID,
      adress: data.adress,
      email: data.email,
      encodedSecurityAnswer: data.securityAnswers,
      securityQuestion: data.securityQuestion,
      encodedRecoverPin: data.encodedRecoverPin,
      userName: data.userName,
      password: data.password,
    );
  }
  factory Professional.fromRemoteModel(RemoteProfessional data) {
    return Professional(
        id: '',
        personalID: data.personalID,
        names: data.names,
        lastNames: data.lastNames,
        countryCode: data.countryCode,
        professionalID: data.professionalID,
        userName: data.userName,
        password: data.password,
        adress: '',
        encodedRecoverPin: '',
        email: '',
        encodedSecurityAnswer: '',
        securityQuestion: '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'personalID': personalID,
      'names': names,
      'lastNames': lastNames,
      'countryCode': countryCode,
      'securityQuestion': securityQuestion,
      'encodedSecurityAnswer': encodedSecurityAnswer,
      'encodedRecoverPin': encodedRecoverPin,
      'adress': adress,
      'email': email,
      'professionalID': professionalID,
      'userName': userName,
      'password': password,
    };
  }
}
