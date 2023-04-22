//Global versioning information

import 'package:flutter/material.dart';

class AppConstants {
  static const String globalVersion = "0.0.1";
  static const String compilationDate = "12/06/2022";

  //ICD API keys enviroment variables
  static const clientId = String.fromEnvironment("clientId");
  static const String clientSecret = String.fromEnvironment("clientSecret");
}

//Form controllers
final loginKey = GlobalKey<FormState>();
final appointmentCreationKey = GlobalKey<FormState>();
