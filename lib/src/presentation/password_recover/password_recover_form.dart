import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/auth_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/professional_repository_interface.dart';
import 'package:aronnax/src/domain/entities/professional.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:aronnax/src/presentation/login/login_main_view.dart';
import 'package:aronnax/src/presentation/password_recover/password_update_form_dialog.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordRecoverForm extends ConsumerStatefulWidget {
  const PasswordRecoverForm({
    super.key,
    required this.professionalData,
  });

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
          Text(
            AppLocalizations.of(context)!
                .passwordRecoverQuestionaryInstructions,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Text(AppLocalizations.of(context)!
              .passwordRecoverQuestionaryPersonalId),
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
          Text(AppLocalizations.of(context)!.passwordRecoverQuestionaryAdress),
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
          Text(AppLocalizations.of(context)!.passwordRecoverQuestionaryEmail),
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
              title: AppLocalizations.of(context)!
                  .passwordRecoverQuestionaryUpdatePasswordTitle,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return PasswordUpdateFormDialog(
                      updateWithPin: false,
                      onPasswordChanged: (newPassword, newPin) {
                        ref
                            .read(professionalRepositoryProvider)
                            .updateProfessionalPassword(
                              ref,
                              widget.professionalData.id,
                              newPassword,
                            );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(AppLocalizations.of(context)!
                                .passwordRecoverQuestionaryPasswordConfirmationAlert),
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
