import 'package:flutter/material.dart';

class ScreenInformationContainer extends StatelessWidget {
  const ScreenInformationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 122, 121, 124),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 6),
            blurRadius: 6,
            color: Color.fromARGB(255, 224, 224, 224),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Information'),
          const Text(
            'Information here',
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
