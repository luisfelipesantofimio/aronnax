import 'package:flutter_riverpod/flutter_riverpod.dart';

//Patient data for clinic history

final currentPatientNames = StateProvider<String>(
  (ref) => "",
);

final currentPatientLastNames = StateProvider<String>(
  (ref) => "",
);

final currentPatientID = StateProvider<String>(
  (ref) => "",
);

final currentPatientBirthDate = StateProvider<String>(
  (ref) => "",
);
final currentPatientContactNumber = StateProvider<String>(
  (ref) => "",
);

final currentPatientMail = StateProvider<String>(
  (ref) => "",
);

final currentPatientAdress = StateProvider<String>(
  (ref) => "",
);

final currentPatientCity = StateProvider<String>(
  (ref) => "",
);

final currentPatientDepartment = StateProvider<String>(
  (ref) => "",
);

final currentPatientState = StateProvider<String>(
  (ref) => "",
);

final currentPatientEducation = StateProvider<String>(
  (ref) => "",
);

final currentPatientOcupation = StateProvider<String>(
  (ref) => "",
);

final currentPatientInsurance = StateProvider<String>(
  (ref) => "",
);

final currentPatientEmergencyName = StateProvider<String>(
  (ref) => "",
);

final currentPatientEmergencyNumber = StateProvider<String>(
  (ref) => "",
);

//Clinic history data

final currentRegister = StateProvider<String>(
  (ref) => "",
);
final currentDate = StateProvider<String>(
  (ref) => "",
);
final currentConsultationReason = StateProvider<String>(
  (ref) => "",
);
final currentMentalExamn = StateProvider<String>(
  (ref) => "",
);
final currentTreatment = StateProvider<String>(
  (ref) => "",
);
final currentMedAntecedents = StateProvider<String>(
  (ref) => "",
);
final currentPsyAntecedents = StateProvider<String>(
  (ref) => "",
);
final currentFamilyHistory = StateProvider<String>(
  (ref) => "",
);
final currentPersonalHistory = StateProvider<String>(
  (ref) => "",
);
final currentDiagnostic = StateProvider<String>(
  (ref) => "",
);
final creator = StateProvider<String>(
  (ref) => "",
);
