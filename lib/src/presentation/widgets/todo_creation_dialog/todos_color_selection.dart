import 'package:flutter/material.dart';

class TodosColorSelection extends StatelessWidget {
  const TodosColorSelection({
    Key? key,
    required this.icon,
    required this.color,
    required this.onSelected,
    required this.isSelected,
  }) : super(key: key);
  final IconData icon;
  final Color color;
  final bool isSelected;
  final Function(Color) onSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelected(color),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(color: Colors.black, width: 1)
              : Border.all(style: BorderStyle.none),
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
