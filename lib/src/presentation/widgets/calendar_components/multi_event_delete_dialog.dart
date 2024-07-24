import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MultiEventDeleteDialog extends StatelessWidget {
  const MultiEventDeleteDialog({
    super.key,
    required this.onDelete,
  });
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!
                  .calendarEventMultideleteDialogDescription,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                      AppLocalizations.of(context)!.registerBackButtonTitle),
                ),
                const Padding(padding: EdgeInsets.only(right: 20)),
                TextButton(
                  onPressed: () {
                    onDelete();
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.continueButton,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
