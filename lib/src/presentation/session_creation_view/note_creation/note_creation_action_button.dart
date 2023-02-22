import 'package:flutter/material.dart';

class NoteCreationActionButton extends StatelessWidget {
  const NoteCreationActionButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 160, 131, 121),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Row(
              children: [
                Icon(
                  icon,
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  title,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
