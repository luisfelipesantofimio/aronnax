//This file is suposed to be completly modified until I figure out how to
//implement a reusable stateful button.

import 'package:aronnax/src/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainOptionsButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const MainOptionsButton(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CustomDarkColors.buttonColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  icon,
                  color: CustomLightColors.textColor,
                ),
              ),
              Flexible(
                child: Text(
                  text,
                  style: GoogleFonts.montserrat(
                      fontSize: 15, color: CustomLightColors.textColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
