import 'package:email_validator/email_validator.dart';

bool validateEmail(String email) {
  return EmailValidator.validate(email);
}
