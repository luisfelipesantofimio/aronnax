import 'package:flutter/material.dart';

class SessionPerformanceElement extends StatelessWidget {
  const SessionPerformanceElement({
    super.key,
    required this.icon,
    required this.title,
    required this.performance,
    required this.isSelected,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final int performance;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    Color? setItemColor(int performance) {
      switch (performance) {
        case 0:
          return Colors.red[300];

        case 1:
          return Colors.cyan[300];
        case 2:
          return Colors.green[300];
        default:
          return Colors.grey;
      }
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          color: isSelected ? setItemColor(performance) : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Icon(icon),
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
