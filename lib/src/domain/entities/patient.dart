// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/domain/entities/remote_model/remote_patient.dart';

class Patient {
  final String names;
  final String lastNames;
  final int idNumber;
  final DateTime birthDate;
  final int contactNumber;
  final String mail;
  final String city;
  final String state;
  final String gender;
  final String adress;
  final String education;
  final String ocupation;
  final String insurance;
  final String emergencyContactName;
  final int emergencyContactNumber;
  final DateTime creationDate;
  final bool isActive;
  Patient({
    required this.names,
    required this.lastNames,
    required this.idNumber,
    required this.birthDate,
    required this.contactNumber,
    required this.mail,
    required this.city,
    required this.state,
    required this.gender,
    required this.adress,
    required this.education,
    required this.ocupation,
    required this.insurance,
    required this.emergencyContactName,
    required this.emergencyContactNumber,
    required this.creationDate,
    required this.isActive,
  });

  factory Patient.fromLocalModel(LocalPatient data) {
    return Patient(
      names: data.names,
      lastNames: data.lastNames,
      idNumber: data.idNumber,
      birthDate: data.birthDate,
      contactNumber: data.contactNumber,
      mail: data.mail,
      city: data.city,
      state: data.state,
      gender: data.gender,
      adress: data.adress,
      education: data.education,
      ocupation: data.ocupation,
      insurance: data.insurance,
      emergencyContactName: data.emergencyContactName,
      emergencyContactNumber: data.emergencyContactNumber,
      creationDate: data.creationDate,
      isActive: data.isActive,
    );
  }
  factory Patient.fromRemoteModel(RemotePatient data) {
    return Patient(
      names: data.names,
      lastNames: data.lastNames,
      idNumber: data.idNumber,
      birthDate: data.birthDate,
      contactNumber: data.contactNumber,
      mail: data.mail,
      city: data.city,
      state: data.state,
      gender: data.gender,
      adress: data.adress,
      education: data.education,
      ocupation: data.ocupation,
      insurance: data.insurance,
      emergencyContactName: data.emergencyContactName,
      emergencyContactNumber: data.emergencyContactNumber,
      creationDate: data.creationDate,
      isActive: data.isActive,
    );
  }
}
