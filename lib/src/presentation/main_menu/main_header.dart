import 'package:aronnax/src/data/providers/dark_mode_provider.dart';
import 'package:aronnax/src/presentation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MainHeader extends ConsumerWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime dateFormat = DateTime.now();
    String currentDate = DateFormat("dd/MM/yyyy").format(dateFormat);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            offset: (Offset(0.0, 0.7)),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Image(
              height: 100,
              image: ref.watch(darkThemeProvider) == ThemeMode.light
                  ? const AssetImage("assets/img/aronnax-icon-dark.png")
                  : const AssetImage("assets/img/aronnax-icon-light.png"),
            ),
          ),
          Text(currentDate, //formated date
              style: Theme.of(context).textTheme.bodyText1),
          Text(
              "Aronnax v${AppConstants.globalVersion}\nCompilación ${AppConstants.compilationDate}",
              style: Theme.of(context).textTheme.bodyText2)
        ],
      ),
    );
  }
}
