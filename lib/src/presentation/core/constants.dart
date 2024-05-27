//Global versioning information

import 'package:flutter/material.dart';

class AppConstants {
  static const String globalVersion = String.fromEnvironment("version");

  //ICD API keys enviroment variables
  static const clientId = String.fromEnvironment("clientId");
  static const String clientSecret = String.fromEnvironment("clientSecret");

  //Supabase enviroment
  static const String supabaseUrl = String.fromEnvironment("supaEndpoint");
  static const String supabaseKey = String.fromEnvironment("supaKey");
}

//Form controllers
final professionalKey = GlobalKey<FormState>();
final appointmentCreationKey = GlobalKey<FormState>();
