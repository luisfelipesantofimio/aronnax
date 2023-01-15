import 'package:aronnax/src/data/providers/dark_mode_provider.dart';
import 'package:aronnax/src/misc/global_values.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_form.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: currentWidth,
            decoration: const BoxDecoration(),
            child: Row(
              children: [
                SizedBox(
                  width: currentWidth * 40 / 100,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "inicio de sesión",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(
                        child: LoginForm(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: currentWidth * 40 / 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(30),
              ),
              color: Theme.of(context).backgroundColor,
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 2.0,
                  blurRadius: 10,
                  offset: Offset(4, 0),
                  color: Colors.black,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 4),
                    SizedBox(
                      width: 200,
                      child: Image(
                        height: 300,
                        image: ref.watch(darkThemeProvider) == ThemeMode.light
                            ? const AssetImage(
                                "assets/img/aronnax-icon-light.png")
                            : const AssetImage(
                                "assets/img/aronnax-icon-dark.png"),
                      ),
                    ),
                    Text(
                      "Aronnax",
                      style: GoogleFonts.montserrat(
                        fontSize: 60,
                        color: ref.watch(darkThemeProvider) == ThemeMode.light
                            ? const Color.fromARGB(255, 215, 215, 215)
                            : const Color.fromARGB(255, 28, 28, 28),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Versión $globalVersion",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color:
                                ref.watch(darkThemeProvider) == ThemeMode.light
                                    ? const Color.fromARGB(255, 215, 215, 215)
                                    : const Color.fromARGB(255, 28, 28, 28),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
