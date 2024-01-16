import 'package:flutter/material.dart';

class ConsultationMenuElement extends StatelessWidget {
  const ConsultationMenuElement(
      {super.key,
      required this.name,
      required this.idNumber,
      required this.onTap});
  final String name;
  final String idNumber;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 80,
          width: 200,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 218, 204, 179),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 163, 163, 163),
                blurRadius: 6,
                offset: Offset(0, 6),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Nombre: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Número de documento: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      idNumber,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
