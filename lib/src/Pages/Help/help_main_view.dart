import 'package:aronnax/src/Pages/Help/legal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var padding = const EdgeInsets.only(left: 60);

class MainHelpView extends ConsumerWidget {
  const MainHelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    const Image(
                      height: 300,
                      image: true
                          ? AssetImage(
                              "assets/img/aronnax-icon-light.png")
                          : AssetImage(
                              "assets/img/aronnax-icon-dark.png"),
                    ),
                    Text(
                      "Aronnax",
                      style: Theme.of(context).textTheme.displayLarge,
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
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, top: 60),
                      child: Text(
                        "Información de desarrollo",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: padding,
                      child: RichText(
                        text: TextSpan(
                          text: "Desarrollado por: ",
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: "Luis Felipe Santofimio Buitrago",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: padding,
                      child: Text(
                        "Aronnax funciona gracias a la tecnología de Flutter.",
                        style: Theme.of(context).textTheme.bodyMedium,
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
