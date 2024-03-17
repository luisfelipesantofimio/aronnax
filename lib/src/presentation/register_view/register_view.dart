import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/forms_providers/register_form_provider.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/presentation/clinic_history_form_screen/clinic_history_register_view.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/register_view/register_form.dart';
import 'package:aronnax/src/presentation/widgets/generic_global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainViewRegister extends ConsumerWidget {
  const MainViewRegister({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 166, 211, 227),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Center(child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: constraints.maxWidth * 0.20,
                    child: Text(
                      AppLocalizations.of(context)!.registerTitle,
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
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
                          AppLocalizations.of(context)!.registerFormTitle,
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
                        width: constraints.maxWidth * 0.8,
                        height: MediaQuery.of(context).size.height * 0.83,
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    top: 20,
                                  ),
                                  child: RegisterForm(),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back),
                                    tooltip: AppLocalizations.of(context)!
                                        .registerBackButtonTitle,
                                  ),
                                  const Padding(padding: EdgeInsets.all(20)),
                                  GenericGlobalButton(
                                    height: 40,
                                    width: 200,
                                    title: AppLocalizations.of(context)!
                                        .registerSaveButtonTitle,
                                    onPressed: () async {
                                      if (basicKey.currentState!.validate()) {
                                        basicKey.currentState!.save();

                                        Patient? patientData = await ref
                                            .read(patientsRepositoryProvider)
                                            .addPatient(
                                              ref: ref,
                                              names: ref
                                                  .read(registerNamesProvider),
                                              lastNames: ref.read(
                                                  registerLastNamesProvider),
                                              adress: ref
                                                  .read(registerAdressProvider),
                                              birthDate: ref.read(
                                                  registerBirthDateProvider),
                                              gender: ref
                                                  .read(registerGenderProvider),
                                              city: ref
                                                  .read(registerCityProvider),
                                              state: ref
                                                  .read(registerStateProvider),
                                              insurance: ref.read(
                                                  registerInsuranceProvider),
                                              education: ref.read(
                                                  registerEducationProvider),
                                              mail: ref
                                                  .read(registerMailProvider),
                                              idNumber: ref.read(
                                                  registerIdNumberProvider),
                                              ocupation: ref.read(
                                                  registerOcupationProvider),
                                              creationDate: DateTime.now(),
                                              contactNumber: ref.read(
                                                  registerConctatNumberProvider),
                                              emergencyContactName: ref.read(
                                                  registerEmergencyContactNameProvider),
                                              emergencyContactNumber: ref.read(
                                                  registerEmergencyContactNumberProvider),
                                              professionalID: ref
                                                  .read(
                                                      globalUserInformationProvider)!
                                                  .id,
                                            );

                                        if (patientData != null) {
                                          Future(() {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors.green,
                                                content: Text(
                                                  AppLocalizations.of(context)!
                                                      .registerSuccessAlertTitle,
                                                ),
                                              ),
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ClinicHistoryRegisterView(
                                                        patientData:
                                                            patientData),
                                              ),
                                            );
                                          });
                                        } else {
                                          Future(() {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(AppLocalizations
                                                        .of(context)!
                                                    .registerErrorAlertTitle),
                                              ),
                                            );
                                          });
                                        }
                                      }
                                    },
                                  )
                                ],
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
            );
          },
        )),
      ),
    );
  }
}
