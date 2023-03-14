import 'package:flutter/material.dart';

class SectionListElement extends StatelessWidget {
  const SectionListElement(
      {Key? key,
      required this.sectionTitle,
      required this.sectionDescription,
      required this.onTap,
      required this.onDelete,
      required this.onEdit})
      : super(key: key);
  final String sectionTitle;
  final String sectionDescription;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white,
          boxShadow: [
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
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
                const Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  sectionTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(sectionDescription),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
