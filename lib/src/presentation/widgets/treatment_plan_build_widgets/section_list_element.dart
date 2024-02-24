import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SectionListElement extends StatelessWidget {
  const SectionListElement({
    super.key,
    required this.sectionTitle,
    required this.sectionDescription,
    required this.onTap,
    required this.onDelete,
    required this.onEdit,
    required this.editionComponent,
    required this.selectedItem,
  });
  final String sectionTitle;
  final String sectionDescription;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onTap;
  final bool editionComponent;
  final bool selectedItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: selectedItem
              ? Colors.white
              : const Color.fromARGB(255, 226, 226, 226),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 3),
              color: Color.fromARGB(255, 212, 212, 212),
              blurRadius: 6,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Visibility(
                          visible: editionComponent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                tooltip:
                                    AppLocalizations.of(context)!.genericEdit,
                                onPressed: onEdit,
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                tooltip:
                                    AppLocalizations.of(context)!.genericDelete,
                                onPressed: onDelete,
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5),
                        ),
                        Text(
                          sectionTitle,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Text(sectionDescription)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
