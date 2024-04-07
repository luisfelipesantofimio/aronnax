import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/database/local_model/tables.dart';

class PatientCompanionModel {
  final String names;
  final String lastNames;
  final int? idNumber;
  final DateTime? birthDate;
  final int? contactNumber;
  final String? mail;
  final CompanionRelationship relationshipp;
  final CompanionReason companionReason;

  PatientCompanionModel(
      {required this.names,
      required this.lastNames,
      required this.idNumber,
      required this.birthDate,
      required this.contactNumber,
      required this.mail,
      required this.relationshipp,
      required this.companionReason});

  factory PatientCompanionModel.fromLocalModel(
      LocalPatientCompanionData localCompanion) {
    return PatientCompanionModel(
        names: localCompanion.names,
        lastNames: localCompanion.lastNames,
        idNumber: localCompanion.idNumber,
        birthDate: localCompanion.birthDate,
        contactNumber: localCompanion.contactNumber,
        mail: localCompanion.mail,
        relationshipp: localCompanion.relationshipp,
        companionReason: localCompanion.companionReason);
  }
}
