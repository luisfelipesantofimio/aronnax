import 'package:crypt/crypt.dart';

bool isPasswordValid(String serverPassword, String inputPassword) {
  bool result = Crypt(serverPassword).match(inputPassword);
  return result;
}
