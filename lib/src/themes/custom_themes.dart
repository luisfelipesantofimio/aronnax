import 'package:aronnax/src/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';
import '../database/settings_model.dart';

GlobalThemeMode settings = themeDB.get("SettingsDB");

ValueNotifier<bool> darkThemeEnabled = ValueNotifier(settings.darkModeEnabled);

class GlobalThemes with ChangeNotifier {
  ThemeMode get currentTheme =>
      darkThemeEnabled.value ? ThemeMode.dark : ThemeMode.light;

  void changeCurrentTheme() {
    darkThemeEnabled.value = !darkThemeEnabled.value;
    themeDB.put(
      "SettingsDB",
      GlobalThemeMode(darkThemeEnabled.value),
    );

    notifyListeners();
  }

  areSettingsEmpty() {
    if (themeDB.isEmpty) {
      themeDB.put(
        "SettingsDB",
        GlobalThemeMode(false),
      );
    }
    notifyListeners();
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: CustomDarkColors.accentColorCustom,
      scaffoldBackgroundColor: CustomDarkColors.background,
      backgroundColor: CustomDarkColors.barColor,
      iconTheme: const IconThemeData(color: CustomDarkColors.buttonColor),
      //Form custom theme
      inputDecorationTheme: const InputDecorationTheme(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 243, 42, 42),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomDarkColors.barColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(66, 214, 214, 214),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      //Text custom theme
      textTheme: TextTheme(
        bodyText1: GoogleFonts.montserrat(
            color: CustomDarkColors.textColor, fontSize: 20),
        bodyText2: GoogleFonts.montserrat(
            color: CustomDarkColors.textColor, fontSize: 15),
        headline1: GoogleFonts.montserrat(
            color: CustomDarkColors.textColor, fontSize: 40),
        headline2: GoogleFonts.montserrat(
            color: CustomDarkColors.textColor, fontSize: 35),
        headline3: GoogleFonts.montserrat(color: CustomDarkColors.textColor),
        headline4: GoogleFonts.montserrat(
          color: CustomDarkColors.textColor,
          fontSize: 30,
        ),
        headline5: GoogleFonts.montserrat(
            color: CustomDarkColors.textColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: CustomDarkColors.accentColorCustom,
      scaffoldBackgroundColor: CustomLightColors.background,
      backgroundColor: CustomLightColors.barColor,
      iconTheme: const IconThemeData(color: CustomLightColors.buttonColor),
      //Form custom theme
      inputDecorationTheme: const InputDecorationTheme(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 243, 42, 42),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomLightColors.barColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(66, 214, 214, 214),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      //Text custom theme
      textTheme: TextTheme(
        bodyText1: GoogleFonts.montserrat(
            color: CustomLightColors.textColor, fontSize: 20),
        bodyText2: GoogleFonts.montserrat(
            color: CustomLightColors.textColor, fontSize: 15),
        headline1: GoogleFonts.montserrat(
            color: CustomLightColors.textColor, fontSize: 40),
        headline2: GoogleFonts.montserrat(
            color: CustomLightColors.textColor, fontSize: 35),
        headline3: GoogleFonts.montserrat(color: CustomLightColors.textColor),
        headline4: GoogleFonts.montserrat(
          color: CustomLightColors.textColor,
          fontSize: 30,
        ),
        headline5: GoogleFonts.montserrat(
            color: CustomLightColors.textColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

GlobalThemes currentTheme = GlobalThemes();
