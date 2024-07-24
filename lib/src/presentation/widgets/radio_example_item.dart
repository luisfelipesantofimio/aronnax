import 'package:flutter/material.dart';

class RadioExampleItem extends StatelessWidget {
  const RadioExampleItem({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        ),
        Text(
          title,
        ),
      ],
    );
  }
}
