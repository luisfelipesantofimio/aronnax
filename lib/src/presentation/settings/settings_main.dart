import 'package:aronnax/src/Pages/Formulary/professionalForm/professional_form.dart';
import 'package:aronnax/src/presentation/settings/localdb_selection.dart';
import 'package:aronnax/src/presentation/settings/setting_options_view_profile.dart';
import 'package:aronnax/src/presentation/settings/theme_select.dart';
import 'package:flutter/material.dart';
import 'settings_headerbar.dart';

class SettingsMain extends StatefulWidget {
  const SettingsMain({Key? key}) : super(key: key);

  @override
  State<SettingsMain> createState() => _SettingsMainState();
}

class _SettingsMainState extends State<SettingsMain> {
  settingSetView() {
    switch (currentView.value) {
      case 0:
        return const SettingsOptionsProfile();

      case 1:
        return const ProfessionalForm();
      case 2:
        return const ThemeSelector();
      case 3:
        return const LocalDBActivationScreen();

      default:
        return const SettingsOptionsProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SettingsHeaderBar(),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: currentView,
              builder: (BuildContext context, value, child) {
                return Center(
                  child: SizedBox(
                    height: double.maxFinite,
                    width: 1000,
                    child: settingSetView(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
