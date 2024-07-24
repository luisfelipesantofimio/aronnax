import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/Pages/help/help_main_view.dart';
import 'package:aronnax/src/presentation/login/login_main_view.dart';
import 'package:aronnax/src/presentation/settings/settings_main.dart';
import 'package:aronnax/src/presentation/widgets/menu_options_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuSettingsOptionContainer extends StatefulWidget {
  const MenuSettingsOptionContainer({super.key});

  @override
  State<MenuSettingsOptionContainer> createState() =>
      _MenuSettingsOptionContainerState();
}

class _MenuSettingsOptionContainerState
    extends State<MenuSettingsOptionContainer> {
  bool isMouseIn = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        isMouseIn = true;
      }),
      onExit: (event) => setState(() {
        isMouseIn = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: isMouseIn
            ? Column(
                children: [
                  MenuOptionsBarItem(
                    icon: FontAwesomeIcons.gear,
                    title: AppLocalizations.of(context)!
                        .mainMenuOptionsBarTitleSettings,
                    isFullSize: isMouseIn,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsMain(),
                      ),
                    ),
                  ),
                  MenuOptionsBarItem(
                    icon: Icons.question_mark,
                    title: AppLocalizations.of(context)!
                        .mainMenuOptionsBarTitleHelp,
                    isFullSize: isMouseIn,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainHelpView(),
                      ),
                    ),
                  ),
                  MenuOptionsBarItem(
                    icon: Icons.logout_outlined,
                    title: AppLocalizations.of(context)!
                        .mainMenuOptionsBarTitleRegisterSignOut,
                    isFullSize: isMouseIn,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.gear,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .mainMenuOptionsBarTitleMoreOptions,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
      ),
    );
  }
}
