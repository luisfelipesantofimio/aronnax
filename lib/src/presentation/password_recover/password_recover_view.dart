import 'package:flutter/material.dart';

class PasswordRecoverView extends StatelessWidget {
  const PasswordRecoverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Recover your password'),
        ],
      ),
    );
  }
}
