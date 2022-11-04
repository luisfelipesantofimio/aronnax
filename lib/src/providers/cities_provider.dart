import 'package:country_state_city/utils/city_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CitiesProvider extends StateNotifier<List<String>> {
  CitiesProvider() : super([]);

  void getCities(String code) async {
    state.clear();
    state.add("Selecciona la ciudad");
    final cities = await getStateCities("CO", code);
    for (var val in cities) {
      String currentString = val.name;
      if (currentString.contains("Department")) {
        List a = currentString.split(" ");
        a.removeWhere((element) => element == "Department");
        String b = a.join();
        currentString = b;

        state.add(currentString);
      } else {
        state.add(val.name);
      }
    }
  }
}

final selectedCityProvider =
    StateNotifierProvider<CitiesProvider, List<String>>(
  (ref) => CitiesProvider(),
);
