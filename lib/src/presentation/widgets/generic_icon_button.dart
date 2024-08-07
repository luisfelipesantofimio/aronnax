import 'package:flutter/material.dart';

class GenericIconButton extends StatelessWidget {
  const GenericIconButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  FittedBox(child: Text(title)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
