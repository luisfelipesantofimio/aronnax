import 'dart:math';

import 'package:aronnax/src/Pages/Formulary/professionalForm/professional_form.dart';
import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/presentation/settings/configOptions/localdb_selection.dart';
import 'package:aronnax/src/presentation/settings/configOptions/theme_select.dart';
import 'package:aronnax/src/presentation/settings/setting_options_view_profile.dart';
import 'package:crypt/crypt.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  String showMainMenuGreet(int hour) {
    if (hour > 23 || hour < 12) {
      return "Buenos días";
    }
    if (hour >= 12 && hour < 19) {
      return "Buenas tardes";
    } else {
      return "Buenas noches";
    }
  }

  Widget settingsScreenIndex(
      ValueNotifier<int> currentView, AsyncValue<Setting> settings) {
    switch (currentView.value) {
      case 0:
        return SettingsOptionsProfile(
          settingsData: settings,
        );

      case 1:
        return const ProfessionalForm();
      case 2:
        return ThemeSelector(
          settingsData: settings,
        );
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
  Color randomColorGenerator() {
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
}
