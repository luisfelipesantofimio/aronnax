import 'package:aronnax/src/Pages/ClinicHistory/clinic_history_search_form.dart';
import 'package:aronnax/src/misc/global_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClinicHistorySearchView extends ConsumerWidget {
  const ClinicHistorySearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: ref.watch(deviceWidth),
          // color: const Color.fromARGB(255, 152, 201, 241),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Buscar historia clínica",
                style: Theme.of(context).textTheme.headline2,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              const ClinicHistorySearchForm(),
              IconButton(
                tooltip: "Volver",
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
