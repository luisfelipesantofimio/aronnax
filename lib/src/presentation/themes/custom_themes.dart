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

//TODO: Fix switch and colors
  static ThemeData get lightTheme {
    return ThemeData(
      dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        surfaceTintColor: CustomLightColors.background,
        actionsPadding: EdgeInsets.all(10),
        shadowColor: Colors.grey,
      ),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: CustomLightColors.primary,
          onPrimary: Colors.black,
          secondary: CustomLightColors.secondary,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: CustomLightColors.background,
          onBackground: Colors.black,
          surface: CustomLightColors.background,
          onSurface: Colors.black),
      primaryColor: CustomLightColors.primary,
      scaffoldBackgroundColor: CustomLightColors.background,
      iconTheme: const IconThemeData(color: CustomLightColors.textColor),
      //Form custom theme
      inputDecorationTheme: const InputDecorationTheme(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 243, 42, 42),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomLightColors.secondary),
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
            color: CustomLightColors.textColor, fontSize: 18),
        bodyMedium: GoogleFonts.montserrat(
            color: CustomLightColors.textColor, fontSize: 15),
        bodySmall: GoogleFonts.montserrat(
            color: CustomLightColors.textColor, fontSize: 12),
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
