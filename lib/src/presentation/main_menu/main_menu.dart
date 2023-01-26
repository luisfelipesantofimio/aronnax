
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/consultations_provider.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/main_menu/main_header.dart';
import 'package:aronnax/src/presentation/main_menu/options_bar.dart';
import 'package:aronnax/src/presentation/widgets/main_menu_options.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

DateTime hour = DateTime.now();
String currentHour = DateFormat("kk").format(hour);
int format = int.parse(currentHour);

dayGreet() {
  if (format > 23 || format < 12) {
    return "Buenos días";
  }
  if (format >= 12 && format < 19) {
    return "Buenas tardes";
  } else {
    return "Buenas noches";
  }
}

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
    String finalGreet = dayGreet();

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
