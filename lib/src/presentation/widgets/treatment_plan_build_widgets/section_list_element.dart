import 'package:flutter/material.dart';

class SectionListElement extends StatelessWidget {
  const SectionListElement({
    Key? key,
    required this.sectionTitle,
    required this.sectionDescription,
    required this.onTap,
    required this.onDelete,
    required this.onEdit,
    required this.editionComponent,
    required this.selectedItem,
  }) : super(key: key);
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
          color:
              selectedItem ? Colors.white : const Color.fromARGB(255, 226, 226, 226),
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: editionComponent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          tooltip: 'Edit',
                          onPressed: onEdit,
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          tooltip: 'Delete',
                          onPressed: onDelete,
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
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
          ),
        ),
      ),
    );
  }
}
