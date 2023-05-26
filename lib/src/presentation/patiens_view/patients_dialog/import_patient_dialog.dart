import 'dart:io';

import 'package:aronnax/src/data/interfaces/io_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImportPatientDataDialog extends ConsumerStatefulWidget {
  const ImportPatientDataDialog({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ImportPatientDataDialog> createState() =>
      _ImportPatientDataDialogState();
}

class _ImportPatientDataDialogState
    extends ConsumerState<ImportPatientDataDialog> {
  File? selectedFile;
  String? passwordToDecrypt;
  @override
  Widget build(BuildContext context) {
    final patientsList = ref.read(patientsListProvider);

    return Dialog(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.4,
        child: patientsList.when(
          data: (data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Import encrypted data'),
                Row(
                  children: [
                    const Text('Select your file: '),
                    TextButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          type: FileType.custom,
                          allowedExtensions: ['arnx.encrypted'],
                        );
                        if (result != null) {
                          setState(() {
                            selectedFile = File(result.files.first.path!);
                          });
                        }
                      },
                      child: Text(
                        selectedFile == null
                            ? 'No file selected'
                            : selectedFile!.path.split('/').last,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          selectedFile = null;
                        });
                      },
                      icon: const Icon(Icons.restart_alt),
                    ),
                  ],
                ),
                const Text('Please, insert the password for file below'),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Your generated decryption password'),
                  onChanged: (value) {
                    setState(() {
                      passwordToDecrypt = value;
                    });
                  },
                ),
                GenericMinimalButton(
                  title: 'Done',
                  onTap: () async {
                    if (selectedFile != null && passwordToDecrypt != null) {
                      File decryptedFile = await ref
                          .read(ioRepositoryProvider)
                          .decryptFile(
                              encryptedFilePath: selectedFile!.path,
                              encryptionKey: passwordToDecrypt!);
                      String decryptedFileContents = await ref
                          .read(ioRepositoryProvider)
                          .readFromTextFile(decryptedFile.path);
                      try {
                        await ref
                            .read(patientsRepositoryProvider)
                            .importPatientData(
                              ref: ref,
                              decryptedPatientData: decryptedFileContents,
                              professionalId:
                                  ref.read(globalUserInformationProvider)!.id,
                            );
                        Future(
                          () => Navigator.pop(context),
                        );
                      } on Exception catch (e) {
                        Future(
                          () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('$e'),
                              ),
                            );
                          },
                        );
                        Future(
                          () {
                            Navigator.pop(context);
                          },
                        );
                        rethrow;
                      }
                    } else {
                      Future(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                                'You must select a file and set a password'),
                          ),
                        );
                      });
                    }
                  },
                ),
              ],
            );
          },
          error: (error, stackTrace) => const Text('Something went wrong.'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
