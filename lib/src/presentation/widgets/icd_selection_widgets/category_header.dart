import 'package:aronnax/src/domain/entities/icd_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IcdDiagnosticHeader extends StatelessWidget {
  const IcdDiagnosticHeader(
      {super.key, required this.categories, required this.onSelectedCategory});
  final List<IcdData> categories;
  final Function(int selectedIndex) onSelectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context)!.icdSelectorTitle,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: Text("${index + 1}. ${categories[index].title}",
                      textAlign: TextAlign.left),
                  onPressed: () {
                    onSelectedCategory(index);
                  },
                ),
                const Divider(
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
