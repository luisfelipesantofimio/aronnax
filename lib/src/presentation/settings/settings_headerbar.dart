import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

ValueNotifier<int> currentView = ValueNotifier(0);

class SettingsHeaderBar extends StatefulWidget {
  const SettingsHeaderBar({super.key});

  @override
  State<SettingsHeaderBar> createState() => _SettingsHeaderBarState();
}

class _SettingsHeaderBarState extends State<SettingsHeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: double.maxFinite,
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                              iconSize: 35,
                              tooltip: AppLocalizations.of(context)!
                                  .registerBackButtonTitle,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .mainMenuOptionsBarTitleSettings,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              currentView.value = 0;
                            });
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .settingsScreenBarTitleInformation,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              currentView.value = 1;
                            });
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .settingsScreenBarTitleDbRepair,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              currentView.value = 2;
                            });
                          },
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.genericSupport,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
