import 'package:aronnax/src/data/interfaces/professional_repository_interface.dart';
import 'package:aronnax/src/data/providers/location_data_provider.dart';
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
  final professionalKey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    final countriesList = ref.watch(countriesListProvider);

    return ListView(
      controller: ScrollController(),
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
                        return "El campo no puede estar vacío";
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Número de identificación personal",
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
                        return "El campo no puede estar vacío";
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Nombres",
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
                        return "El campo no puede estar vacío";
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Apellidos",
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
                        return "El campo no puede estar vacío";
                      }

                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Your adress",
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
                        return "El campo no puede estar vacío";
                      }

                      if (!AppMethods().validateEmail(value)) {
                        return 'Invalid email format';
                      }

                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Your email",
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
                        return "El campo no puede estar vacío";
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Tarjeta profesional",
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
                      decoration:
                          const InputDecoration(hintText: 'Select your country'),
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
                          return 'You must select a value';
                        }
                        return null;
                      },
                    ),
                    error: (error, stackTrace) => Row(
                      children: [
                        const Text('Something went wrong'),
                        TextButton(
                          onPressed: () =>
                              ref.invalidate(countriesListProvider),
                          child: const Text('Try again'),
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
                        return "El campo no puede estar vacío";
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Nombre de usuario",
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
                        return "El campo no puede estar vacío";
                      }
                      if (value.length < 8) {
                        return 'The password must have at least eight characters.';
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Tu contraseña",
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
                        return "El campo no puede estar vacío";
                      }
                      if (password2 != password) {
                        return "The passwords don't match!";
                      }

                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Confirma tu contraseña",
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
                        return "El campo no puede estar vacío";
                      }

                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Pregunta de seguridad",
                      helperText:
                          'Deberás recordar esta pregunta en caso de perder tu contraseña',
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
                        return "El campo no puede estar vacío";
                      }

                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Tu respuesta",
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
                                securityAnswer: securityAnswer!);

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
