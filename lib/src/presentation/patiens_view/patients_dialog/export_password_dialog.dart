import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExportPasswordDialog extends StatelessWidget {
  const ExportPasswordDialog({
    Key? key,
    required this.fileName,
    required this.password,
  }) : super(key: key);
  final String fileName;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your key for the file $fileName.encrypted',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 242, 239, 239),
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
                          icon: Icon(
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
