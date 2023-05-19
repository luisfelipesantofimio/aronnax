import 'dart:developer';
import 'dart:io';

import 'package:aronnax/src/data/interfaces/io_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/patiens_view/patients_dialog/import_patient_dialog.dart';
import 'package:aronnax/src/presentation/patiens_view/patients_list.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientsView extends ConsumerWidget {
  const PatientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  tooltip: 'Import patient data',
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) => ImportPatientDataDialog(),
                    );
                  },
                  icon: Icon(
                    Icons.input,
                  ),
                ),
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
