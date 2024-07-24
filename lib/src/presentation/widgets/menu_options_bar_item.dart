// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MenuOptionsBarItem extends StatefulWidget {
  const MenuOptionsBarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isFullSize,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isFullSize;

  @override
  State<MenuOptionsBarItem> createState() => _MenuOptionsBarItemState();
}

class _MenuOptionsBarItemState extends State<MenuOptionsBarItem> {
  bool isMouseIn = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) => setState(() {
          isMouseIn = true;
        }),
        onExit: (event) => setState(() {
          isMouseIn = false;
        }),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 200,
            ),
            decoration: isMouseIn
                ? const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white,
                  )
                : const BoxDecoration(),
            child: widget.isFullSize
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          widget.icon,
                          color: isMouseIn
                              ? const Color.fromARGB(255, 4, 1, 40)
                              : Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                              color: isMouseIn
                                  ? const Color.fromARGB(255, 4, 1, 40)
                                  : Colors.white),
                        ),
                      ],
                    ),
                  )
                : Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 20,
                  ),
          ),
        ),
      ),
    );
  }
}
