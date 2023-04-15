import 'package:aronnax/src/presentation/patiens_view/patients_list.dart';
import 'package:flutter/material.dart';

class PatientsView extends StatelessWidget {
  const PatientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            color: const Color.fromARGB(255, 189, 218, 242),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Consultantes registrados'),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: PatientsList(),
              )),
        ],
      ),
    );
  }
}
