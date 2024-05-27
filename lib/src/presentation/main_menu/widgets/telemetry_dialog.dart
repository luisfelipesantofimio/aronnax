import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/telemetry.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TelemetryDialog extends ConsumerWidget {
  const TelemetryDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).textTheme;
    return Dialog(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.telemetryDialogTitle,
                    style: theme.titleLarge),
                SizedBox(
                  width: constraints.maxWidth * 0.6,
                  child: Text(
                    AppLocalizations.of(context)!.telemetryDialogDescription,
                    style: theme.bodyMedium,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(20)),
                SizedBox(
                  width: constraints.maxWidth * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GenericMinimalButton(
                          title: AppLocalizations.of(context)!.genericCancel,
                          onTap: () async {
                            await ref
                                .read(telemetryRepositoryProvider)
                                .createInstallationProfile(ref,
                                    acceptedTerms: false);
                            Future(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(AppLocalizations.of(context)!
                                      .telemetryDialogRejectMessage),
                                ),
                              );
                              Navigator.pop(context);
                            });
                          }),
                      const Padding(
                        padding: EdgeInsets.all(20),
                      ),
                      GenericMinimalButton(
                        title: AppLocalizations.of(context)!.genericAccept,
                        onTap: () {
                          ref
                              .read(telemetryRepositoryProvider)
                              .createInstallationProfile(ref,
                                  acceptedTerms: true);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(AppLocalizations.of(context)!
                                  .telemetryDialogAcceptMessage),
                            ),
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
