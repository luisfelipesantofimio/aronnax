import 'package:aronnax/src/misc/global_values.dart';
import 'package:aronnax/src/themes/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //library for date formating

class MainHeader extends StatelessWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: ValueListenableBuilder(
              valueListenable: darkThemeEnabled,
              builder: (BuildContext context, value, c) {
                return Image(
                  width: 100,
                  alignment: Alignment.centerLeft,
                  image: darkThemeEnabled.value
                      ? const AssetImage("assets/img/aronnax-icon-light.png")
                      : const AssetImage("assets/img/aronnax-icon-dark.png"),
                );
              },
            ),
          ),
          Text(currentDate, //formated date
              style: Theme.of(context).textTheme.bodyText1),
          Text("Aronnax v$globalVersion\nCompilación $compilationDate",
              style: Theme.of(context).textTheme.bodyText2)
        ],
      ),
    );
  }
}
