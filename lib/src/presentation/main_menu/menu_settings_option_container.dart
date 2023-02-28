import 'package:aronnax/src/Pages/Help/help_main_view.dart';
import 'package:aronnax/src/presentation/login/login_main_view.dart';
import 'package:aronnax/src/presentation/settings/settings_main.dart';
import 'package:aronnax/src/presentation/widgets/menu_options_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuSettingsOptionContainer extends StatefulWidget {
  const MenuSettingsOptionContainer({Key? key}) : super(key: key);

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
                    title: 'Ajustes',
                    isFullSize: isMouseIn,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsMain(),
                      ),
                    ),
                  ),
                  MenuOptionsBarItem(
                    icon: Icons.logout_outlined,
                    title: 'Ayuda',
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
                    title: 'Cerrar sesión',
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
                children: const [
                  Icon(
                    FontAwesomeIcons.gear,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(
                    'Más opciones',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
      ),
    );
  }
}
