import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';

class ImportPatientDataDialog extends StatelessWidget {
  const ImportPatientDataDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    //define password and file location:
    // String passwordToDecrypt = '';
    //             FilePickerResult? result =
    //                 await FilePicker.platform.pickFiles(
    //               allowMultiple: false,
    //               type: FileType.custom,
    //               allowedExtensions: ['arnx.encrypted'],
    //             );

//Implement decryption and data saving
    // if (result != null) {
    //             Future(() {
    //               showDialog(
    //                 context: context,
    //                 builder: (context) => ImportPatientDataDialog(
    //                   fileName: result.files.first.path!.split('/').last,
    //                   onPasswordChanged: (password) {
    //                     passwordToDecrypt = password;
    //                   },
    //                 ),
    //               );
    //               log(passwordToDecrypt);
    //             });
    //             log(passwordToDecrypt);
    //             File decryptedFile = await ref
    //                 .read(ioRepositoryProvider)
    //                 .decryptFile(
    //                     encryptedFilePath: result.files.first.path!,
    //                     encryptionKey: passwordToDecrypt);
    //             String decryptedFileContents = await ref
    //                 .read(ioRepositoryProvider)
    //                 .readFromTextFile(decryptedFile.path);
    //             ref.read(patientsRepositoryProvider).importPatientData(
    //                   ref: ref,
    //                   decryptedPatientData: decryptedFileContents,
    //                   professionalId:
    //                       ref.read(globalUserInformationProvider)!.id,
    //                 );
    //           }

    //TODO: implement UI and functionality on data import
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: [
            Text('Import encrypted data'),
            Text('Please, insert the password for file below'),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Your generated decryption password'),
              onChanged: (value) {},
            ),
            GenericMinimalButton(
              title: 'Done',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
