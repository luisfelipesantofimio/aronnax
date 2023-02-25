import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerNamesProvider = StateProvider<String>(
  (ref) => '',
);

final registerLastNamesProvider = StateProvider<String>(
  (ref) => '',
);

final registerIdNumberProvider = StateProvider<int>(
  (ref) => 0,
);

final registerGenderProvider = StateProvider<String>(
  (ref) => '',
);

final registerBirthDateProvider = StateProvider<DateTime>(
  (ref) => DateTime(
    DateTime.now().year - 10,
  ),
);

final registerConctatNumberProvider = StateProvider<int>(
  (ref) => 0,
);

final registerMailProvider = StateProvider<String>(
  (ref) => '',
);

final registerCityProvider = StateProvider<String>(
  (ref) => '',
);

final registerStateProvider = StateProvider<String>(
  (ref) => '',
);

final registerAdressProvider = StateProvider<String>(
  (ref) => '',
);

final registerEducationProvider = StateProvider<String>(
  (ref) => '',
);

final registerOcupationProvider = StateProvider<String>(
  (ref) => '',
);

final registerInsuranceProvider = StateProvider<String>(
  (ref) => '',
);

final registerEmergencyContactNameProvider = StateProvider<String>(
  (ref) => '',
);

final registerEmergencyContactNumberProvider = StateProvider<int>(
  (ref) => 0,
);
