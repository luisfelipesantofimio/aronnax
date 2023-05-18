import 'dart:convert';

import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/domain/entities/remote_model/remote_patient.dart';

class Patient {
  final int id;
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
    required this.id,
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
      id: data.id,
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
      id: 0,
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'names': names,
      'lastNames': lastNames,
      'idNumber': idNumber,
      'birthDate': birthDate.millisecondsSinceEpoch,
      'contactNumber': contactNumber,
      'mail': mail,
      'city': city,
      'state': state,
      'gender': gender,
      'adress': adress,
      'education': education,
      'ocupation': ocupation,
      'insurance': insurance,
      'emergencyContactName': emergencyContactName,
      'emergencyContactNumber': emergencyContactNumber,
      'creationDate': creationDate.millisecondsSinceEpoch,
      'isActive': isActive,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'] as int,
      names: map['names'] as String,
      lastNames: map['lastNames'] as String,
      idNumber: map['idNumber'] as int,
      birthDate: DateTime.fromMillisecondsSinceEpoch(map['birthDate'] as int),
      contactNumber: map['contactNumber'] as int,
      mail: map['mail'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      gender: map['gender'] as String,
      adress: map['adress'] as String,
      education: map['education'] as String,
      ocupation: map['ocupation'] as String,
      insurance: map['insurance'] as String,
      emergencyContactName: map['emergencyContactName'] as String,
      emergencyContactNumber: map['emergencyContactNumber'] as int,
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int),
      isActive: map['isActive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) =>
      Patient.fromMap(json.decode(source) as Map<String, dynamic>);

  Patient copyWith({
    int? id,
    String? names,
    String? lastNames,
    int? idNumber,
    DateTime? birthDate,
    int? contactNumber,
    String? mail,
    String? city,
    String? state,
    String? gender,
    String? adress,
    String? education,
    String? ocupation,
    String? insurance,
    String? emergencyContactName,
    int? emergencyContactNumber,
    DateTime? creationDate,
    bool? isActive,
  }) {
    return Patient(
      id: id ?? this.id,
      names: names ?? this.names,
      lastNames: lastNames ?? this.lastNames,
      idNumber: idNumber ?? this.idNumber,
      birthDate: birthDate ?? this.birthDate,
      contactNumber: contactNumber ?? this.contactNumber,
      mail: mail ?? this.mail,
      city: city ?? this.city,
      state: state ?? this.state,
      gender: gender ?? this.gender,
      adress: adress ?? this.adress,
      education: education ?? this.education,
      ocupation: ocupation ?? this.ocupation,
      insurance: insurance ?? this.insurance,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactNumber:
          emergencyContactNumber ?? this.emergencyContactNumber,
      creationDate: creationDate ?? this.creationDate,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  bool operator ==(covariant Patient other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.names == names &&
        other.lastNames == lastNames &&
        other.idNumber == idNumber &&
        other.birthDate == birthDate &&
        other.contactNumber == contactNumber &&
        other.mail == mail &&
        other.city == city &&
        other.state == state &&
        other.gender == gender &&
        other.adress == adress &&
        other.education == education &&
        other.ocupation == ocupation &&
        other.insurance == insurance &&
        other.emergencyContactName == emergencyContactName &&
        other.emergencyContactNumber == emergencyContactNumber &&
        other.creationDate == creationDate &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        names.hashCode ^
        lastNames.hashCode ^
        idNumber.hashCode ^
        birthDate.hashCode ^
        contactNumber.hashCode ^
        mail.hashCode ^
        city.hashCode ^
        state.hashCode ^
        gender.hashCode ^
        adress.hashCode ^
        education.hashCode ^
        ocupation.hashCode ^
        insurance.hashCode ^
        emergencyContactName.hashCode ^
        emergencyContactNumber.hashCode ^
        creationDate.hashCode ^
        isActive.hashCode;
  }

  @override
  String toString() {
    return 'Patient(id: $id, names: $names, lastNames: $lastNames, idNumber: $idNumber, birthDate: $birthDate, contactNumber: $contactNumber, mail: $mail, city: $city, state: $state, gender: $gender, adress: $adress, education: $education, ocupation: $ocupation, insurance: $insurance, emergencyContactName: $emergencyContactName, emergencyContactNumber: $emergencyContactNumber, creationDate: $creationDate, isActive: $isActive)';
  }
}
