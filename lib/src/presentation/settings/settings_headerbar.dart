import 'package:flutter/material.dart';

ValueNotifier<int> currentView = ValueNotifier(0);

class SettingsHeaderBar extends StatefulWidget {
  const SettingsHeaderBar({Key? key}) : super(key: key);

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
                    color: Theme.of(context).colorScheme.background,
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
                              tooltip: "Volver",
                            ),
                          ),
                          Text(
                            "Ajustes",
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
                                  "Mi información",
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
                                  "Crear usuario",
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Tema oscuro",
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
                              currentView.value = 3;
                            });
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Base de datos local",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
