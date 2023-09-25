import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dart:math';
import 'package:aronnax/src/data/interfaces/professional_repository_interface.dart';
import 'package:aronnax/src/data/providers/location_data_provider.dart';
import 'package:aronnax/src/presentation/core/constants.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:aronnax/src/presentation/icd_view/icd_view.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:country_state_city/country_state_city.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalProfessionalRegister extends ConsumerStatefulWidget {
  const LocalProfessionalRegister({Key? key}) : super(key: key);

  @override
  LocalProfessionalRegisterState createState() =>
      LocalProfessionalRegisterState();
}

class LocalProfessionalRegisterState
    extends ConsumerState<LocalProfessionalRegister> {
  int? personalID;
  String? names;
  String? lastNames;
  int? professionalID;
  String? userName;
  String? selectedCountryCode;
  String? password;
  String? password2;
  String? adress;
  String? email;
  String? securityQuestion;
  String? securityAnswer;

  int securityPin = int.parse(
      List.generate(6, (index) => Random().nextInt(9)).toList().join());

  @override
  Widget build(BuildContext context) {
    final countriesList = ref.watch(countriesListProvider);

    return ListView(
      children: [
        Form(
          key: professionalKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.errorEmptyField;
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context)!.welcomeScreenPersonalID,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onChanged: (varID) {
                      setState(() {
                        personalID = int.parse(varID);
                      });
                      professionalKey.currentState!.validate();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.errorEmptyField;
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context)!.welcomeScreenNames,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onChanged: (varNames) {
                      setState(() {
                        names = varNames;
                      });
                      professionalKey.currentState!.validate();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.errorEmptyField;
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context)!.welcomeScreenLastNames,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onChanged: (varLastNames) {
                      setState(() {
                        lastNames = varLastNames;
                      });
                      professionalKey.currentState!.validate();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.errorEmptyField;
                      }

                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!
                          .welcomeScreenYourAddress,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onChanged: (value) {
                      setState(() {
                        adress = value;
                      });
                      professionalKey.currentState!.validate();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.errorEmptyField;
                      }

                      if (!AppMethods().validateEmail(value)) {
                        return AppLocalizations.of(context)!
                            .registerFormErrorEmail;
                      }

                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context)!.welcomeScreenYourEmail,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                      professionalKey.currentState!.validate();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.errorEmptyField;
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!
                          .welcomeScreenProfessionalID,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (varProfessionalID) {
                      setState(() {
                        professionalID = int.parse(varProfessionalID);
                      });
                      professionalKey.currentState!.validate();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: countriesList.when(
                    data: (data) => DropdownButtonFormField(
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .welcomeScreenSelectCountry),
                      items: data
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Row(
                                children: [
                                  Text(e.flag),
                                  Text(e.name),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      value: selectedCountryCode == null
                          ? null
                          : data.elementAt(data.indexWhere((element) =>
                              element.isoCode == selectedCountryCode)),
                      onChanged: (Country? value) {
                        setState(() {
                          selectedCountryCode = value!.isoCode;
                        });
                        professionalKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (selectedCountryCode == null) {
                          return AppLocalizations.of(context)!
                              .genericSelectionText;
                        }
                        return null;
                      },
                    ),
                    error: (error, stackTrace) => Row(
                      children: [
                        Text(AppLocalizations.of(context)!.genericErrorMessage),
                        TextButton(
                          onPressed: () =>
                              ref.invalidate(countriesListProvider),
                          child: Text(AppLocalizations.of(context)!.tryAgain),
                        ),
                      ],
                    ),
                    loading: () => const CircularProgressIndicator(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.errorEmptyField;
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context)!.welcomeScreenUsername,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onChanged: (userVar) {
                      setState(() {
                        userName = userVar;
                      });
                      professionalKey.currentState!.validate();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.errorEmptyField;
                      }
                      if (value.length < 8) {
                        return AppLocalizations.of(context)!
                            .welcomeScreenErrorPasswordLenght;
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!
                          .welcomeScreenYourPassword,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onChanged: (varPassword) {
                      setState(() {
                        password = varPassword;
                      });
                      professionalKey.currentState!.validate();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.errorEmptyField;
                      }
                      if (password2 != password) {
                        return AppLocalizations.of(context)!
                            .genericErrorPasswordsDontMatch;
                      }

                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!
                          .welcomeScreenYourPassword,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onChanged: (varPassword) {
                      setState(() {
                        password2 = varPassword;
                      });
                      professionalKey.currentState!.validate();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.errorEmptyField;
                      }

                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!
                          .welcomeScreenSecurityQuestion,
                      helperText: AppLocalizations.of(context)!
                          .welcomeScreenSecurityQuestionDescription,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onChanged: (value) {
                      setState(() {
                        securityQuestion = value;
                      });
                      professionalKey.currentState!.validate();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.errorEmptyField;
                      }

                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context)!.welcomeScreenYourAnswer,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onChanged: (value) {
                      setState(() {
                        securityAnswer = value;
                      });
                      professionalKey.currentState!.validate();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!
                                .welcomeScreenPinDescription),
                            Row(
                              children: [
                                Text(
                                  securityPin.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  tooltip: AppLocalizations.of(context)!
                                      .welcomeScreenRegeneratePin,
                                  onPressed: () {
                                    setState(() {
                                      securityPin = int.parse(List.generate(
                                              6, (index) => Random().nextInt(9))
                                          .join());
                                    });
                                  },
                                  icon: const Icon(Icons.refresh),
                                ),
                                IconButton(
                                  tooltip: AppLocalizations.of(context)!
                                      .genericCopyMessage("PIN"),
                                  onPressed: () {
                                    Clipboard.setData(
                                      ClipboardData(
                                        text: securityPin.toString(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.copy,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: GenericMinimalButton(
                    title: 'Continuar',
                    onTap: () {
                      if (professionalKey.currentState!.validate()) {
                        professionalKey.currentState!.save();

                        ref
                            .read(professionalRepositoryProvider)
                            .createProfessionalProfile(
                                securityPin: securityPin,
                                ref: ref,
                                names: names!,
                                lastNames: lastNames!,
                                userName: userName!,
                                personalId: personalID!,
                                adress: adress!,
                                email: email!,
                                professionalId: professionalID!,
                                countryCode: selectedCountryCode!,
                                password: password!,
                                securityQuestion: securityQuestion!,
                                securityAnswer: securityAnswer!.toLowerCase());

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("¡Hola! $names"),
                          ),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const IcdView(isConfigured: false),
                            ));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
