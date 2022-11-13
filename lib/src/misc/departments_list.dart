import 'dart:developer';
import 'package:country_state_city/utils/state_utils.dart';

List<String> departmentsList = [];
List<String> departmentsCodes = [];

void getStates() async {
  departmentsList.clear();
  departmentsList.add("Selecciona el departamento");
  departmentsCodes.add("Codes");
  final states = await getStatesOfCountry("CO");
  for (var val in states) {
    String currentString = val.name;
    if (currentString.contains("Department")) {
      List a = currentString.split(" ");
      log(a.toString());
      a.removeWhere((element) => element == "Department");
      String b = a.join(" ");
      currentString = b;

      departmentsList.add(currentString);
      departmentsCodes.add(val.isoCode);
    } else {
      departmentsList.add(val.name);
      departmentsCodes.add(val.isoCode);
    }
  }
}
