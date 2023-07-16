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
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Reparación completa!'),
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
                  'Reparar base de datos de códigos de diagnóstico',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                const Text(
                    'Si durante el proceso de descarga hubo un error o no encuentras un código que debería existir, puedes reparar la base de datos.'),
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
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
          );
    // return icdData.when(data: (data) {
    //   return
    // }, error: error, loading: loading);
  }
}
