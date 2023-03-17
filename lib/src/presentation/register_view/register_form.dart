import 'package:aronnax/src/data/providers/forms_providers/register_form_provider.dart';
import 'package:aronnax/src/data/providers/location_data_provider.dart';
import 'package:aronnax/src/domain/entities/gender.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:aronnax/src/presentation/widgets/date_selector.dart';
import 'package:country_state_city/country_state_city.dart' as state;
import 'package:country_state_city/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends ConsumerState<RegisterForm> {
  String stateCode = '';
  String selectedCity = '';
  List<Gender> genders = [
    Gender(value: 'masculine', name: 'Masculino'),
    Gender(value: 'femenine', name: 'Femenino'),
    Gender(value: 'other', name: 'Otro'),
  ];

  @override
  Widget build(BuildContext context) {
    final stateList = ref.watch(stateListProvider);
    final citiesList = ref.watch(
      citiesListProvider(stateCode),
    );

    return Form(
      key: basicKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Nombres",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valNames) {
                    ref.read(registerNamesProvider.notifier).update(
                          (state) => valNames,
                        );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                    return null;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Apellidos",
                      labelStyle: Theme.of(context).textTheme.bodyMedium),
                  onChanged: (valLastNames) {
                    ref.read(registerLastNamesProvider.notifier).update(
                          (state) => valLastNames,
                        );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: Theme.of(context).textTheme.bodyMedium,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Número de identificación",
                      labelStyle: Theme.of(context).textTheme.bodyMedium),
                  onChanged: (valID) {
                    ref.read(registerIdNumberProvider.notifier).update(
                          (state) => int.parse(valID),
                        );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                    return null;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    hintText: 'Género',
                  ),
                  items: genders
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                  onChanged: (Gender? value) {
                    ref
                        .read(registerGenderProvider.notifier)
                        .update((state) => value!.value);
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              DateSelector(
                  date: ref.watch(registerBirthDateProvider),
                  onChanged: (valDate) {
                    ref.read(registerBirthDateProvider.notifier).update(
                          (state) => valDate,
                        );
                  }),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                child: TextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: Theme.of(context).textTheme.bodyMedium,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Número de contacto",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valPhone) {
                    ref.read(registerConctatNumberProvider.notifier).update(
                          (state) => int.parse(valPhone),
                        );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Correo electrónico",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valMail) {
                    ref.read(registerMailProvider.notifier).update(
                          (state) => valMail,
                        );
                    basicKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    } else {
                      if (!AppMethods().validateEmail(value)) {
                        return "Correo inválido";
                      }
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                child: stateList.when(
                  data: (data) => DropdownButtonFormField(
                    isExpanded: true,
                    style: Theme.of(context).textTheme.bodyText2,
                    value: data.elementAt(0),
                    items: data
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.name,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (state.State? value) {
                      ref.read(registerStateProvider.notifier).update(
                            (state) => value!.name,
                          );
                      setState(() {
                        stateCode = value!.isoCode;
                      });
                      ref.invalidate(citiesListProvider);
                    },
                  ),
                  error: (error, stackTrace) => Row(
                    children: [
                      const Text('Something went wrong'),
                      TextButton(
                        onPressed: () => ref.invalidate(stateListProvider),
                        child: const Text('Try again'),
                      )
                    ],
                  ),
                  loading: () => const CircularProgressIndicator(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                child: citiesList.when(
                  data: (data) => DropdownButtonFormField(
                    style: Theme.of(context).textTheme.bodyText2,
                    value: data.isNotEmpty ? data.elementAt(0) : null,
                    items: data
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                    onChanged: (City? value) {
                      ref.read(registerCityProvider.notifier).update(
                            (state) => value!.name,
                          );
                    },
                  ),
                  error: (error, stackTrace) => Row(
                    children: [
                      const Text('Something went wrong'),
                      TextButton(
                        onPressed: () => ref.invalidate(citiesListProvider),
                        child: const Text('Try again'),
                      )
                    ],
                  ),
                  loading: () => const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Dirección",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valAdress) {
                    ref.read(registerAdressProvider.notifier).update(
                          (state) => valAdress,
                        );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Escolaridad",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valStudies) {
                    ref.read(registerEducationProvider.notifier).update(
                          (state) => valStudies,
                        );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                    return null;
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Ocupación",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valOcupation) {
                    ref.read(registerOcupationProvider.notifier).update(
                          (state) => valOcupation,
                        );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "EPS",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valInsurance) {
                    ref.read(registerInsuranceProvider.notifier).update(
                          (state) => valInsurance,
                        );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                    return null;
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Nombre de contacto de emergencia",
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valEmergencyName) {
                    ref
                        .read(registerEmergencyContactNameProvider.notifier)
                        .update(
                          (state) => valEmergencyName,
                        );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inserta un valor";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(10)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: TextFormField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: Theme.of(context).textTheme.bodyMedium,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Número de contacto de emergencia",
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              onChanged: (emergencyNumber) {
                ref
                    .read(registerEmergencyContactNumberProvider.notifier)
                    .update(
                      (state) => int.parse(emergencyNumber),
                    );
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Inserta un valor";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
