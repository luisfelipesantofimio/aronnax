import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/forms_providers/register_form_provider.dart';
import 'package:aronnax/src/data/providers/location_data_provider.dart';
import 'package:aronnax/src/domain/entities/gender.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
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
  List<Gender> genders = [];
  bool patientFound = false;
  @override
  void didChangeDependencies() {
    setState(() {
      genders = [
        Gender(
          value: 'masculine',
          name: AppLocalizations.of(context)!.registerFormMaleOption,
        ),
        Gender(
            value: 'femenine',
            name: AppLocalizations.of(context)!.registerFormFemaleOption),
        Gender(
            value: 'other',
            name: AppLocalizations.of(context)!.registerFormOtherOption),
      ];
    });
    super.didChangeDependencies();
  }

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
                    labelText:
                        AppLocalizations.of(context)!.registerFormNamesField,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valNames) {
                    ref.read(registerNamesProvider.notifier).update(
                          (state) => valNames,
                        );
                    basicKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
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
                      labelText: AppLocalizations.of(context)!
                          .registerFormLastNamesField,
                      labelStyle: Theme.of(context).textTheme.bodyMedium),
                  onChanged: (valLastNames) {
                    ref.read(registerLastNamesProvider.notifier).update(
                          (state) => valLastNames,
                        );
                    basicKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
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
                      labelText: AppLocalizations.of(context)!
                          .registerFormIdentificationNumberField,
                      labelStyle: Theme.of(context).textTheme.bodyMedium),
                  onChanged: (valID) async {
                    ref.read(registerIdNumberProvider.notifier).update(
                          (state) => int.parse(valID),
                        );
                    List<Patient> foundPatients = await ref
                        .read(patientsRepositoryProvider)
                        .getPatient(ref, int.parse(valID));
                    if (foundPatients.isNotEmpty) {
                      setState(() {
                        patientFound = true;
                      });
                    } else {
                      setState(() {
                        patientFound = false;
                      });
                    }
                    basicKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
                    }
                    if (patientFound) {
                      return AppLocalizations.of(context)!
                          .registerFormErrorUserExists;
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
                  decoration: InputDecoration(
                    hintText:
                        AppLocalizations.of(context)!.registerFormSexField,
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
                    basicKey.currentState!.validate();
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
                    labelText: AppLocalizations.of(context)!
                        .registerFormContactNumberField,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valPhone) {
                    ref.read(registerConctatNumberProvider.notifier).update(
                          (state) => int.parse(valPhone),
                        );
                    basicKey.currentState!.validate();
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
                    labelText:
                        AppLocalizations.of(context)!.registerFormEmailField,
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
                      return AppLocalizations.of(context)!.errorEmptyField;
                    } else {
                      if (!AppMethods().validateEmail(value)) {
                        return AppLocalizations.of(context)!
                            .registerFormErrorEmail;
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
                    style: Theme.of(context).textTheme.bodyMedium,
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
                      basicKey.currentState!.validate();
                    },
                  ),
                  error: (error, stackTrace) => Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.genericErrorMessage,
                      ),
                      TextButton(
                        onPressed: () => ref.invalidate(stateListProvider),
                        child: Text(AppLocalizations.of(context)!.tryAgain),
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
                    style: Theme.of(context).textTheme.bodyMedium,
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
                      basicKey.currentState!.validate();
                    },
                  ),
                  error: (error, stackTrace) => Row(
                    children: [
                      Text(AppLocalizations.of(context)!.genericErrorMessage),
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
                    labelText:
                        AppLocalizations.of(context)!.registerFormAdressField,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valAdress) {
                    ref.read(registerAdressProvider.notifier).update(
                          (state) => valAdress,
                        );
                    basicKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
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
                    labelText: AppLocalizations.of(context)!
                        .registerFormEducationalAttainmentField,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valStudies) {
                    ref.read(registerEducationProvider.notifier).update(
                          (state) => valStudies,
                        );
                    basicKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
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
                    labelText: AppLocalizations.of(context)!
                        .registerFormOcupationField,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valOcupation) {
                    ref.read(registerOcupationProvider.notifier).update(
                          (state) => valOcupation,
                        );
                    basicKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
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
                    labelText: AppLocalizations.of(context)!
                        .registerFormInsuranceField,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valInsurance) {
                    ref.read(registerInsuranceProvider.notifier).update(
                          (state) => valInsurance,
                        );
                    basicKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
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
                    labelText: AppLocalizations.of(context)!
                        .registerFormEmergencyContanctNameField,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onChanged: (valEmergencyName) {
                    ref
                        .read(registerEmergencyContactNameProvider.notifier)
                        .update(
                          (state) => valEmergencyName,
                        );
                    basicKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.errorEmptyField;
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
                labelText: AppLocalizations.of(context)!
                    .registerFormEmergencyContanctNumberField,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              onChanged: (emergencyNumber) {
                ref
                    .read(registerEmergencyContactNumberProvider.notifier)
                    .update(
                      (state) => int.parse(emergencyNumber),
                    );
                basicKey.currentState!.validate();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!.errorEmptyField;
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
