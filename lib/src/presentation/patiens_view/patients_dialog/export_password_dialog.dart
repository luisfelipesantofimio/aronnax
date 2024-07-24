import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExportPasswordDialog extends StatelessWidget {
  const ExportPasswordDialog({
    super.key,
    required this.fileName,
    required this.password,
  });
  final String fileName;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Your key for the file $fileName.encrypted',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 242, 239, 239),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * 0.8,
                          child: const Text(
                              "Remember to keep this password safe during its transmission. If you lose it, you will not be able to recover the data again."),
                        ),
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(text: password),
                            );
                          },
                          icon: const Icon(
                            Icons.copy,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
