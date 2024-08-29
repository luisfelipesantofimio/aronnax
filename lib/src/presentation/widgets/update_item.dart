import 'package:aronnax/src/data/providers/updates_provider.dart';
import 'package:aronnax/src/domain/entities/update_data.dart';
import 'package:aronnax/src/presentation/core/constants.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateItem extends ConsumerWidget {
  const UpdateItem({super.key, required this.updateData});
  final UpdateData updateData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // height: MediaQuery.sizeOf(context).height * 0.2,
      width: MediaQuery.sizeOf(context).width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  ref
                      .read(displayUpdateAnoucement.notifier)
                      .update((state) => false);
                },
                icon: const Icon(Icons.close),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Text(AppLocalizations.of(context)!.updateItemTitle),
            Text(
              updateData.version,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                launchUrl(Uri.parse(
                    "${AppConstants.projectUrl}/${AppMethods.sanitizeCurrentLocale()}/download"));
              },
              child: Text(AppLocalizations.of(context)!.updateItemGetButton),
            ),
          ],
        ),
      ),
    );
  }
}
