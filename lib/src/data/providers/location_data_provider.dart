import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:country_state_city/country_state_city.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateListProvider = FutureProvider.autoDispose<List<State>>(
  (ref) => getStatesOfCountry(
    ref.read(globalProfessionalCountryCodeProvider),
  ),
);

final citiesListProvider =
    FutureProvider.family.autoDispose<List<City>, String>(
  (ref, stateCode) => getStateCities(
      ref.read(globalProfessionalCountryCodeProvider), stateCode),
);

final countriesListProvider = FutureProvider.autoDispose<List<Country>>(
  (ref) => getAllCountries(),
);

final countryByCodeProvider =
    FutureProvider.family.autoDispose<Country?, String>(
  (ref, countryCode) => getCountryFromCode(countryCode),
);
