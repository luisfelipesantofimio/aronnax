import 'package:crypt/crypt.dart';

class AuthRepository {
  bool loginUser(String obtainedPassword, userPassword) {
    return Crypt(obtainedPassword).match(userPassword);
  }
}
