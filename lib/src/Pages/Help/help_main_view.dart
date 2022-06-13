import 'package:aronnax/src/Pages/Help/legal_info.dart';
import 'package:aronnax/src/misc/global_constants.dart';
import 'package:aronnax/src/themes/custom_themes.dart';
import 'package:flutter/material.dart';

var padding = const EdgeInsets.only(left: 60);

class MainHelpView extends StatelessWidget {
  const MainHelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder(
                        valueListenable: darkThemeEnabled,
                        builder: (BuildContext context, value, c) {
                          return Image(
                            height: 300,
                            image: darkThemeEnabled.value
                                ? const AssetImage(
                                    "assets/img/aronnax-icon-light.png")
                                : const AssetImage(
                                    "assets/img/aronnax-icon-dark.png"),
                          );
                        }),
                    Text(
                      "Aronnax",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        "Un software de gestión de pacientes e historias clínicas, minimalista y eficiente.\nHecho por psicólogos, para psicólogos.",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, top: 60),
                      child: Text(
                        "Información de desarrollo",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Padding(
                      padding: padding,
                      child: RichText(
                        text: TextSpan(
                          text: "Desarrollado por: ",
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            TextSpan(
                              text: "Luis Felipe Santofimio Buitrago",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: padding,
                      child: Text(
                        "Aronnax funciona gracias a la tecnología de Flutter.",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: TextButton(
                        child: const Text("Información legal"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const LegalInfo()),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, top: 20),
                      child: RichText(
                        text: TextSpan(
                          text: "Desarrollado con ",
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            const WidgetSpan(
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                            TextSpan(
                              text: " en Crearte Consciencia.",
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: padding,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                tooltip: "Volver",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
