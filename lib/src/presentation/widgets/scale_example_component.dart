import 'package:flutter/material.dart';

class ScaleExampleComponent extends StatelessWidget {
  const ScaleExampleComponent(
      {Key? key,
      required this.valueTitle,
      required this.labelTitle,
      required this.onDelete})
      : super(key: key);
  final String valueTitle;
  final String labelTitle;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Container(
        margin: const EdgeInsets.only(right: 200, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(width: 1, color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Valor: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 80,
                        child: Text(valueTitle),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Etiqueta: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 80, child: Text(labelTitle)),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.delete,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
