import 'package:aronnax/src/presentation/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalThemes {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: CustomDarkColors.accentColorCustom,
      scaffoldBackgroundColor: CustomDarkColors.background,
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
        bodyLarge: GoogleFonts.montserrat(
            color: CustomDarkColors.textColor, fontSize: 20),
        bodyMedium: GoogleFonts.montserrat(
            color: CustomDarkColors.textColor, fontSize: 15),
        displayLarge: GoogleFonts.montserrat(
            color: CustomDarkColors.textColor, fontSize: 40),
        displayMedium: GoogleFonts.montserrat(
            color: CustomDarkColors.textColor, fontSize: 35),
        displaySmall: GoogleFonts.montserrat(color: CustomDarkColors.textColor),
        headlineMedium: GoogleFonts.montserrat(
          color: CustomDarkColors.textColor,
          fontSize: 30,
        ),
        headlineSmall: GoogleFonts.montserrat(
            color: CustomDarkColors.textColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      //colorScheme: ColorScheme(background: CustomDarkColors.barColor, surface: null),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: CustomDarkColors.accentColorCustom,
      scaffoldBackgroundColor: CustomLightColors.background,
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
        bodyLarge: GoogleFonts.montserrat(
            color: CustomLightColors.textColor, fontSize: 20),
        bodyMedium: GoogleFonts.montserrat(
            color: CustomLightColors.textColor, fontSize: 15),
        displayLarge: GoogleFonts.montserrat(
            color: CustomLightColors.textColor, fontSize: 40),
        displayMedium: GoogleFonts.montserrat(
            color: CustomLightColors.textColor, fontSize: 35),
        displaySmall:
            GoogleFonts.montserrat(color: CustomLightColors.textColor),
        headlineMedium: GoogleFonts.montserrat(
          color: CustomLightColors.textColor,
          fontSize: 30,
        ),
        headlineSmall: GoogleFonts.montserrat(
            color: CustomLightColors.textColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      //colorScheme: ColorScheme(background: CustomLightColors.barColor),
    );
  }
}

GlobalThemes currentTheme = GlobalThemes();
