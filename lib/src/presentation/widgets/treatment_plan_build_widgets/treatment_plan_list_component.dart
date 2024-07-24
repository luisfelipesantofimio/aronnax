import 'package:flutter/material.dart';

class TreatmentPlanListComponent extends StatelessWidget {
  const TreatmentPlanListComponent({
    super.key,
    required this.component,
    required this.onEdit,
    required this.onDelete,
    required this.onDuplicate,
    required this.editionComponent,
  });
  final Widget component;
  final VoidCallback onDuplicate;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final bool editionComponent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: Color.fromARGB(255, 219, 219, 219),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: editionComponent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    tooltip: 'Duplicate',
                    onPressed: onDuplicate,
                    icon: const Icon(Icons.copy),
                  ),
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
            ),
            component,
          ],
        ),
      ),
    );
  }
}
