import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TodosColorSelection extends StatelessWidget {
  const TodosColorSelection({
    Key? key,
    required this.icon,
    required this.color,
    required this.onSelected,
  }) : super(key: key);
  final IconData icon;
  final Color color;
  final Function(Color) onSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelected(color),
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Icon(
              icon,
              size: 12,
            ),
          ),
        ),
      ),
    );
  }
}
