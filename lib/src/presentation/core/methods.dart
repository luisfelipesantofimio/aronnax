import 'dart:math';

import 'package:crypt/crypt.dart';
import 'package:email_validator/email_validator.dart';

class AppMethods {
  bool isPasswordValid(String serverPassword, String inputPassword) {
    bool result = Crypt(serverPassword).match(inputPassword);
    return result;
  }

  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  String codeGeneration(int len) {
    final random = Random();
    const charList =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    String result = List.generate(
      len,
      (index) => charList[random.nextInt(charList.length)],
    ).join();
    return result;
  }

  String showMainMenuGreet(int hour) {
    if (hour > 23 || hour < 12) {
      return "Buenos días";
    }
    if (hour >= 12 && hour < 19) {
      return "Buenas tardes";
    } else {
      return "Buenas noches";
    }
  }
}
