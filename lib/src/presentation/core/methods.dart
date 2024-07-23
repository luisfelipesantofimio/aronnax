import 'dart:math';

import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/domain/entities/session.dart';
import 'package:aronnax/src/presentation/settings/configOptions/icd_data_repair.dart';
import 'package:aronnax/src/presentation/settings/configOptions/localdb_selection.dart';
import 'package:aronnax/src/presentation/settings/configOptions/support_screen.dart';
import 'package:aronnax/src/presentation/settings/setting_options_view_profile.dart';
import 'package:crypt/crypt.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890-_/&#!*+';
    String result = List.generate(
      len,
      (index) => charList[random.nextInt(charList.length)],
    ).join();
    return result;
  }

  String generateRandomLetters(int len) {
    const charList =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    String result = List.generate(
      len,
      (index) => charList[Random().nextInt(charList.length)],
    ).join();
    return result;
  }

  String showMainMenuGreet(BuildContext context, int hour, String name) {
    if (hour > 23 || hour < 12) {
      return AppLocalizations.of(context)!.menuGreetMorning(name);
    }
    if (hour >= 12 && hour < 19) {
      return AppLocalizations.of(context)!.menuGreetAfternoon(name);
    }
    if (hour >= 19 && hour < 23) {
      return AppLocalizations.of(context)!.menuGreetEvening(name);
    }
    return AppLocalizations.of(context)!.menuGreetMorning(name);
  }

  Widget settingsScreenIndex(
      ValueNotifier<int> currentView, AsyncValue<Setting> settings) {
    switch (currentView.value) {
      case 0:
        return SettingsOptionsProfile(
          settingsData: settings,
        );

      case 1:
        return const IcdDataRepair();
      case 2:
        return const SupportScreen();
      case 3:
        return LocalDBActivationScreen(
          settingsData: settings,
        );

      default:
        return SettingsOptionsProfile(
          settingsData: settings,
        );
    }
  }

  CalendarEventStates parseCalendarEventStateFromString(String state) {
    switch (state) {
      case 'scheduled':
        return CalendarEventStates.scheduled;

      case 'cancelled':
        return CalendarEventStates.cancelled;
      case 'done':
        return CalendarEventStates.done;
      default:
        return CalendarEventStates.scheduled;
    }
  }

  String parseCalendarEventStateFromEnum(CalendarEventStates state) {
    switch (state) {
      case CalendarEventStates.scheduled:
        return 'scheduled';

      case CalendarEventStates.cancelled:
        return 'cancelled';

      case CalendarEventStates.done:
        return 'done';

      default:
        return 'scheduled';
    }
  }

  CalendarEventType parseCalendarEventTypeFromString(String data) {
    switch (data) {
      case 'meeting':
        return CalendarEventType.meeting;

      case 'consultation':
        return CalendarEventType.consultation;
      case 'following':
        return CalendarEventType.following;
      default:
        return CalendarEventType.meeting;
    }
  }

  String parseCalendarEventTypeFromEnum(CalendarEventType data) {
    switch (data) {
      case CalendarEventType.meeting:
        return 'meeting';

      case CalendarEventType.consultation:
        return 'consultation';

      case CalendarEventType.following:
        return 'following';

      default:
        return 'meeting';
    }
  }

  Color setEventTypeColor(CalendarEventType type) {
    switch (type) {
      case CalendarEventType.meeting:
        return const Color.fromARGB(255, 232, 219, 181);

      case CalendarEventType.consultation:
        return const Color.fromARGB(255, 138, 194, 227);
      case CalendarEventType.following:
        return const Color.fromARGB(255, 153, 221, 190);
      default:
        return Colors.grey;
    }
  }

  int ageCalculator(DateTime birthday) {
    DateTime birthdate = birthday;
    DateTime now = DateTime.now();

    int age = now.year - birthdate.year;
    if (now.month < birthdate.month ||
        (now.month == birthdate.month && now.day < birthdate.day)) {
      age--;
    }
    return age;
  }

  IconData getUserGenderIcon(String gender) {
    switch (gender) {
      case 'masculine':
        return FontAwesomeIcons.mars;
      case 'femenine':
        return FontAwesomeIcons.venus;

      default:
        return FontAwesomeIcons.genderless;
    }
  }

  /// Just returns a random color for any purpose
  static Color randomColorGenerator() {
    List<Color> colorsList = [
      const Color.fromARGB(255, 138, 193, 238),
      const Color.fromARGB(255, 152, 241, 169),
      const Color.fromARGB(255, 238, 183, 147),
      const Color.fromARGB(255, 241, 152, 177),
      const Color.fromARGB(255, 217, 152, 241),
      const Color.fromARGB(255, 237, 241, 152),
    ];

    Random random = Random();
    return colorsList[random.nextInt(colorsList.length)];
  }

  Color setEventStatusColor(CalendarEventStates state) {
    switch (state) {
      case CalendarEventStates.cancelled:
        return const Color.fromARGB(255, 249, 184, 179);

      case CalendarEventStates.done:
        return const Color.fromARGB(255, 177, 245, 202);
      case CalendarEventStates.scheduled:
        return const Color.fromARGB(255, 240, 224, 176);
      default:
        return Colors.grey;
    }
  }

  String partiallyObscureText(String originalText) {
    int numCharactersToReplace = (originalText.length * (50 / 100)).round();

    List<int> indexes = List.generate(originalText.length, (index) => index);
    indexes.shuffle();

    for (int i = 0; i < numCharactersToReplace; i++) {
      int index = indexes[i];
      originalText = originalText.replaceRange(index, index + 1, '*');
    }

    return originalText;
  }

  List<String> generateListOfSimilarText(String originalText) {
    List<String> newValues = [];

    for (var i = 0; i < 2; i++) {
      newValues.add(originalText
          .split('')
          .map((e) => e != "." && e != "@" && e != '-' && e != '#' && e != ' '
              ? generateRandomLetters(1)
              : e)
          .toList()
          .join());
    }
    newValues.add(originalText);
    newValues.shuffle();
    return newValues;
  }

  List<int> generateListOfSimilarNumbers(int originalNumber) {
    List<int> newValues = [];
    for (var i = 0; i < 2; i++) {
      newValues.add(int.parse(originalNumber
          .toString()
          .split('')
          .toList()
          .map(
            (e) => Random().nextInt(9),
          )
          .toList()
          .join()));
    }
    newValues.add(originalNumber);
    newValues.shuffle();

    return newValues;
  }

  IconData getTreatmentPlanOutcomeIcon(String outcome) {
    switch (outcome) {
      case 'positive':
        return FontAwesomeIcons.faceSmile;
      case 'neutral':
        return FontAwesomeIcons.faceMeh;
      case 'negative':
        return FontAwesomeIcons.faceSadCry;
      default:
        return FontAwesomeIcons.faceMeh;
    }
  }

  Color getTreatmentPlanOutcomeColor(String outcome) {
    switch (outcome) {
      case 'positive':
        return Colors.green;
      case 'neutral':
        return Colors.blue;
      case 'negative':
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  ///This method must be used for parsing [Session] values.
  String getSessionPerformanceAsText(int sessionPerformance) {
    switch (sessionPerformance) {
      case 0:
        return 'bad';
      case 1:
        return 'regular';
      case 2:
        return 'good';
      default:
        return '';
    }
  }

  ///This method must be used for parsing [Session] values.
  Color getSessionPerformanceColor(int outcome) {
    switch (outcome) {
      case 2:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 0:
        return Colors.red;
      default:
        return Colors.white;
    }
  }
}
