import 'package:aronnax/src/data/interfaces/auth_repository_interface.dart';
import 'package:aronnax/src/domain/entities/professional.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordRecoverForm extends ConsumerStatefulWidget {
  const PasswordRecoverForm({
    Key? key,
    required this.professionalData,
  }) : super(key: key);

  final Professional professionalData;

  @override
  ConsumerState<PasswordRecoverForm> createState() =>
      _PasswordRecoverFormState();
}

class _PasswordRecoverFormState extends ConsumerState<PasswordRecoverForm> {
  int? selectedId;
  String? selectedAdress;
  String? selectedEmail;
  late List<int> idNumbers;
  late List<String> adreessList;
  late List<String> emailList;
  late List<String> idNumbersObscured;
  late List<String> adressObscured;
  late List<String> emailObscured;

  @override
  void initState() {
    setState(() {
      idNumbers = AppMethods()
          .generateListOfSimilarNumbers(widget.professionalData.personalID);
      idNumbersObscured = idNumbers
          .map(
            (e) => AppMethods().partiallyObscureText(
              e.toString(),
            ),
          )
          .toList();
      adreessList = AppMethods()
          .generateListOfSimilarText(widget.professionalData.adress);
      emailList =
          AppMethods().generateListOfSimilarText(widget.professionalData.email);
      emailObscured = emailList
          .map(
            (e) => AppMethods().partiallyObscureText(e),
          )
          .toList();
      adressObscured = adreessList
          .map(
            (e) => AppMethods().partiallyObscureText(e),
          )
          .toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const Text(
            'Responde las siguientes preguntas para confirmar tu identidad',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          const Text('Select your personal Id'),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: idNumbers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Radio<int>(
                      value: idNumbers[index],
                      groupValue: selectedId,
                      onChanged: (value) {
                        setState(() {
                          selectedId = idNumbers[index];
                        });
                      },
                    ),
                    Text(
                      idNumbersObscured[index],
                    )
                  ],
                );
              },
            ),
          ),
          const Text('Select your home adress'),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: adreessList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Radio<String>(
                      value: adreessList[index],
                      groupValue: selectedAdress,
                      onChanged: (value) {
                        setState(() {
                          selectedAdress = adreessList[index];
                        });
                      },
                    ),
                    Text(
                      adressObscured[index],
                    )
                  ],
                );
              },
            ),
          ),
          const Text('Select your email adress'),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: emailList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Radio<String>(
                      value: emailList[index],
                      groupValue: selectedEmail,
                      onChanged: (value) {
                        setState(() {
                          selectedEmail = emailList[index];
                        });
                      },
                    ),
                    Text(
                      emailObscured[index],
                    )
                  ],
                );
              },
            ),
          ),
          Visibility(
            visible: ref.read(authenticationProvider).validateAccountData(
                  inputPersonalId: selectedId ?? 0,
                  inputAdress: selectedAdress ?? '',
                  inputEmail: selectedEmail ?? '',
                  professionalData: widget.professionalData,
                ),
            child: GenericMinimalButton(
              title: 'Update your password',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
