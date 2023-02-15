import 'package:flutter/material.dart';

class GenericGlobalButton extends StatefulWidget {
  const GenericGlobalButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.title,
      required this.onPressed})
      : super(key: key);
  final double height;
  final double width;
  final String title;
  final VoidCallback onPressed;

  @override
  State<GenericGlobalButton> createState() => _GenericGlobalButtonState();
}

class _GenericGlobalButtonState extends State<GenericGlobalButton> {
  bool isMouseOn = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) {
        setState(() {
          isMouseOn = !isMouseOn;
        });
      },
      child: InkWell(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(
            microseconds: 200,
          ),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: isMouseOn
                ? const Color.fromARGB(255, 57, 162, 248)
                : const Color.fromARGB(255, 84, 168, 238),
          ),
          child: Center(
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
