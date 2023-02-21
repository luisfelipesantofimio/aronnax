import 'package:flutter/material.dart';

class TodoCategoryItem extends StatelessWidget {
  const TodoCategoryItem({
    Key? key,
    required this.title,
    required this.itemColor,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Color itemColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: itemColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            30,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title.length > 10
                  ? title.replaceRange(10, title.length, '...')
                  : title,
              style: const TextStyle(fontSize: 12),
            ),
            IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.close,
                size: 12,
              ),
            )
          ],
        )),
      ),
    );
  }
}
