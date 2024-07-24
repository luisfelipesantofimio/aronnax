import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/icd_data_provider.dart';
import 'package:aronnax/src/presentation/icd_view/icd_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final icdStateProvider = StateProvider<bool>((ref) => false);

class IcdDataRepair extends ConsumerStatefulWidget {
  const IcdDataRepair({super.key});

  @override
  ConsumerState<IcdDataRepair> createState() => _IcdDataRepairState();
}

class _IcdDataRepairState extends ConsumerState<IcdDataRepair> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(icdStateProvider)
        ? IcdView(
            isConfigured: true,
            onDownloadCompleted: (completedTask) {
              Future(() {
                ref
                    .read(icdStateProvider.notifier)
                    .update((state) => completedTask);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(AppLocalizations.of(context)!
                        .icdDataRepairConfirmation),
                  ),
                );
              });
            },
          )
        : Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.icdDataRepairTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  AppLocalizations.of(context)!.icdDataRepairDescription,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                TextButton(
                  onPressed: () {
                    ref
                        .read(localDatabaseRepositoryProvider)
                        .deleteSavedIcdData();
                    ref.invalidate(icdDataProvider);
                    ref.read(icdStateProvider.notifier).update((state) => true);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.continueButton,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
          );
  }
}
