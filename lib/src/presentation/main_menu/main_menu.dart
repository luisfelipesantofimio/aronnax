import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/consultations_provider.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/main_menu/main_header.dart';
import 'package:aronnax/src/presentation/main_menu/options_bar.dart';
import 'package:aronnax/src/presentation/widgets/main_menu_options.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainMenu extends ConsumerStatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  MainMenuState createState() => MainMenuState();
}

class MainMenuState extends ConsumerState<MainMenu> {
  @override
  void didChangeDependencies() {
    if (!ref.watch(globalOfflineStatusProvider)) {
      ref.read(globalQueriedPatientProvider.notifier).getPatientInfo();
      ref.read(globalQueriedClinicHistoryProvider.notifier).getPatientInfo();
      ref
          .read(globalQueriedSessionsProvider.notifier)
          .fetchCurrentSessionData();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String professionalNames = ref.read(globalUserNameProvider);
    String finalGreet = AppMethods().showMainMenuGreet(DateTime.now().hour);

    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const MainHeader(),
            const MainMenuOptions(),
            Text("$finalGreet $professionalNames ¿Qué deseas hacer?",
                style: Theme.of(context).textTheme.displayMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  child: Container(
                    alignment: Alignment.center,
                    width: 500,
                    child: const OptionsBar(),
                  ),
                ),
                const Image(
                  height: 300,
                  alignment: Alignment.bottomRight,
                  image: AssetImage("assets/img/planta.png"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
