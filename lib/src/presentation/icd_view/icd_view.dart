import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/icd_data_provider.dart';
import 'package:aronnax/src/presentation/welcome_screens/finish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IcdView extends ConsumerWidget {
  const IcdView({
    Key? key,
    required this.isConfigured,
    this.onDownloadCompleted,
  }) : super(key: key);
  final bool isConfigured;
  final Function(bool completedTask)? onDownloadCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icdData = ref.watch(icdDataProvider(
        "https://id.who.int/icd/release/11/2023-01/mms/334423054"));

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icdData.when(
            skipLoadingOnRefresh: false,
            data: (data) {
              if (onDownloadCompleted != null) {
                onDownloadCompleted!(false);
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.icdSuccess,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  const Icon(
                    FontAwesomeIcons.laptopMedical,
                    size: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(AppLocalizations.of(context)!.icdSuccessDescription),
                  const Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  TextButton(
                    onPressed: () => isConfigured
                        ? Navigator.pop(context)
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FinishConfig(),
                            ),
                          ),
                    child: Text(
                      AppLocalizations.of(context)!.continueButton,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => Column(
              children: [
                Text('Error $error'),
                Text(stackTrace.toString()),
                TextButton(
                  onPressed: () => {
                    ref
                        .read(localDatabaseRepositoryProvider)
                        .deleteSavedIcdData(),
                    ref.invalidate(icdDataProvider),
                  },
                  child: Text(AppLocalizations.of(context)!.tryAgain),
                ),
              ],
            ),
            loading: () => SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.icdLoadingTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(AppLocalizations.of(context)!.icdLoadingDescription),
                  const CircularProgressIndicator()
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
