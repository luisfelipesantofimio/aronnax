import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/forms_providers/register_form_provider.dart';
import 'package:aronnax/src/data/database/local_model/local_queries.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/register_view/register_form.dart';
import 'package:aronnax/src/presentation/widgets/generic_global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainViewRegister extends ConsumerWidget {
  const MainViewRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isOfflineEnabled = ref.watch(globalOfflineStatusProvider);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 166, 211, 227),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: const Text(
                    'Registrar consultante',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Información personal",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            15,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  top: 20,
                                ),
                                child: RegisterForm(),
                              )),
                          SizedBox(
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back),
                                    tooltip: "Volver",
                                  ),
                                  const Padding(padding: EdgeInsets.all(20)),
                                  GenericGlobalButton(
                                    height: 40,
                                    width: 200,
                                    title: "Guardar registro",
                                    onPressed: () {
                                      if (basicKey.currentState!.validate()) {
                                        basicKey.currentState!.save();

                                        // isOfflineEnabled
                                        //     ?
                                        addLocalPatient(
                                          names:
                                              ref.read(registerNamesProvider),
                                          lastNames: ref
                                              .read(registerLastNamesProvider),
                                          adress:
                                              ref.read(registerAdressProvider),
                                          birthDate: ref
                                              .read(registerBirthDateProvider),
                                          city: ref.read(registerCityProvider),
                                          state:
                                              ref.read(registerStateProvider),
                                          insurance: ref
                                              .read(registerInsuranceProvider),
                                          education: ref
                                              .read(registerEducationProvider),
                                          mail: ref.read(registerMailProvider),
                                          idNumber: ref
                                              .read(registerIdNumberProvider),
                                          ocupation: ref
                                              .read(registerOcupationProvider),
                                          creationDate: DateTime.now(),
                                          contactNumber: ref.read(
                                              registerConctatNumberProvider),
                                          emergencyContactName: ref.read(
                                              registerEmergencyContactNameProvider),
                                          emergencyContactNumber: ref.read(
                                              registerEmergencyContactNumberProvider),
                                          professionalID: ref.read(
                                              globalProfessionalPersonalIDProvider),
                                        );
                                        // : insertPatientData(
                                        //     names,
                                        //     lastNames,
                                        //     birthdate,
                                        //     ID,
                                        //     phoneNumber,
                                        //     mail,
                                        //     selectedCity,
                                        //     selectedState,
                                        //     adress,
                                        //     insurance,
                                        //     education,
                                        //     ocupation,
                                        //     emergencyContactName,
                                        //     emergencyContactNumber);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("Información guardada"),
                                          ),
                                        );
                                        Navigator.pop(context);
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}