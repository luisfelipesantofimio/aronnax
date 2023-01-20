import 'package:aronnax/src/data/interfaces/location_repository_interface.dart';
import 'package:country_state_city/country_state_city.dart';

class LocationRepository implements LocationRepositoryInterface {
  @override
  Future<List<State>> getSelectedState(String countryCode) async {
    return await getStatesOfCountry(countryCode);
  }

  @override
  Future<List<Country>> selectCountryCode() async {
    return await getAllCountries();
  }

  @override
  Future<Country?> getCountryByCode(String countryCode) async {
    return await getCountryFromCode(countryCode);
  }
}
