import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/Pages/help/legal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var padding = const EdgeInsets.only(left: 60);

class MainHelpView extends ConsumerWidget {
  const MainHelpView({super.key});

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
                      image: AssetImage("assets/img/aronnax-icon-dark.png"),
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
                        AppLocalizations.of(context)!.helpScreenDescriptionText,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, top: 60),
                      child: Text(
                        AppLocalizations.of(context)!.helpScreenTitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: padding,
                      child: RichText(
                        text: TextSpan(
                          text:
                              "${AppLocalizations.of(context)!.helpScreenDevelopedBy}: ",
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
                        AppLocalizations.of(context)!
                            .helpScreenAronnaxPoweredBy,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: TextButton(
                        child: Text(AppLocalizations.of(context)!
                            .helpScreenLegalInformationTitle),
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
                tooltip: AppLocalizations.of(context)!.registerBackButtonTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//Commit this
