import 'package:aronnax/src/data/repositories/location_repository.dart';
import 'package:country_state_city/country_state_city.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class LocationRepositoryInterface {
  Future<List<Country>> selectCountryCode();

  Future<List<State>> getSelectedState(String countryCode);

  Future<Country?> getCountryByCode(String countryCode);
}

final locationProvider = Provider<LocationRepositoryInterface>(
  (ref) => LocationRepository(),
);
