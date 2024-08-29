//Global versioning information

import 'package:flutter/material.dart';

class AppConstants {
  static const String globalVersion = String.fromEnvironment("version");

  static const String projectUrl = "https://aronnax-emr.netlify.app";

  //ICD API keys enviroment variables
  static const clientId = String.fromEnvironment("clientId");
  static const String clientSecret = String.fromEnvironment("clientSecret");

  //Supabase enviroment
  static const String supabaseUrl = String.fromEnvironment("supaEndpoint");
  static const String supabaseKey = String.fromEnvironment("supaKey");

  //Github environments
  static const githubEndpoint = String.fromEnvironment("githubEndpoint");
  static const githubToken = String.fromEnvironment("githubToken");
  static const githubApiVersion = String.fromEnvironment("githubApiVersion");
}

//Form controllers
final professionalKey = GlobalKey<FormState>();
final appointmentCreationKey = GlobalKey<FormState>();
