import 'package:flutter_riverpod/flutter_riverpod.dart';

//Providers used for information handling on clinic history creation form

final clinicHistoryRegisterNumberProvider = StateProvider<String>(
  (ref) => '',
);

final clinicHistoryConsultationReasonProvider = StateProvider<String>(
  (ref) => '',
);

final clinicHistoryMentalExaminationProvider = StateProvider<String>(
  (ref) => '',
);

final clinicHistoryTreatmentProvider = StateProvider<String>(
  (ref) => '',
);

final clinicHistoryMedAntecedentsProvider = StateProvider<String>(
  (ref) => '',
);

final clinicHistoryPsyAntecedentsProvider = StateProvider<String>(
  (ref) => '',
);

final clinicHistoryFamilyHistoryProvider = StateProvider<String>(
  (ref) => '',
);

final clinicHistoryPersonalHistoryProvider = StateProvider<String>(
  (ref) => '',
);

final clinicHistoryDiagnosticProvider = StateProvider<String>(
  (ref) => '',
);
