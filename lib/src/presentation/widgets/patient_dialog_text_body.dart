import 'package:flutter/material.dart';

class PatientDialogTextBody extends StatelessWidget {
  const PatientDialogTextBody(
      {Key? key,
      required this.constrains,
      required this.title,
      required this.body,
      required this.title2,
      required this.body2})
      : super(key: key);
  final BoxConstraints constrains;
  final String title;
  final String body;
  final String title2;
  final String body2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        children: [
          SizedBox(
            width: constrains.maxWidth * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(body),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: constrains.maxWidth * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title2,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(body2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
