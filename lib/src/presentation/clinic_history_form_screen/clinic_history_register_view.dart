import 'dart:developer';

import 'package:aronnax/src/Pages/Formulary/widgets/consultant_selection_dialog.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/forms_providers/clinic_history_form_provider.dart';
import 'package:aronnax/src/data/providers/forms_providers/register_form_provider.dart';
import 'package:aronnax/src/data/remote_database/server_api.dart';
import 'package:aronnax/src/presentation/clinic_history_form_screen/clinic_history_register_form.dart';
import 'package:aronnax/src/data/database/local_model/local_queries.dart';
import 'package:aronnax/src/presentation/clinic_history_form_screen/clinic_history_register_info.dart';
import 'package:aronnax/src/presentation/core/controllers.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/main_menu/main_menu.dart';
import 'package:aronnax/src/presentation/widgets/generic_global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ClinicHistoryRegisterView extends ConsumerStatefulWidget {
  const ClinicHistoryRegisterView({
    Key? key,
    required this.patientName,
  }) : super(key: key);
  final String patientName;

  @override
  ConsumerState<ClinicHistoryRegisterView> createState() =>
      _ClinicHistoryRegisterViewState();
}

class _ClinicHistoryRegisterViewState
    extends ConsumerState<ClinicHistoryRegisterView> {
  String registerCode = '';

  @override
  void initState() {
    setState(() {
      registerCode =
          "HC-${AppMethods().codeGeneration(8)}-${DateFormat('ddMM').format(DateTime.now())}";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isOfflineEnabled = ref.watch(offlineStatusProvider).value!;

    int professionalID = ref.watch(globalUserInformationProvider)!.personalID;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 166, 211, 227),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: ClinicHistoryRegisterInformation(
                  patientName: widget.patientName, registerCode: registerCode),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "Historia clínica",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: const Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                                top: 20,
                              ),
                              child: ClinicHistoryRegisterForm(),
                            ),
                          ),
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
                                  tooltip: "Volver",
                                ),
                                const Padding(padding: EdgeInsets.all(20)),
                                GenericGlobalButton(
                                  height: 40,
                                  width: 200,
                                  title: "Guardar registro",
                                  onPressed: () {
                                    if (clinicHistoryKey.currentState!
                                        .validate()) {
                                      isOfflineEnabled
                                          ? addLocalClinicHistory(
                                              registerCode,
                                              DateTime.now(),
                                              ref.read(
                                                  clinicHistoryMentalExaminationProvider),
                                              ref.read(
                                                  clinicHistoryMedAntecedentsProvider),
                                              ref.read(
                                                  clinicHistoryPsyAntecedentsProvider),
                                              ref.read(
                                                  clinicHistoryFamilyHistoryProvider),
                                              ref.read(
                                                  clinicHistoryPersonalHistoryProvider),
                                              ref.read(
                                                  registerIdNumberProvider),
                                              professionalID)
                                          : insertClinicHistory(
                                              registerCode,
                                              DateTime.now(),
                                              ref.read(
                                                  clinicHistoryMentalExaminationProvider),
                                              ref.read(
                                                  clinicHistoryMedAntecedentsProvider),
                                              ref.read(
                                                  clinicHistoryPsyAntecedentsProvider),
                                              ref.read(
                                                  clinicHistoryFamilyHistoryProvider),
                                              ref.read(
                                                  clinicHistoryPersonalHistoryProvider),
                                              ref.read(
                                                  globalSelectedConsultantIDProvider),
                                              professionalID);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text("Historia guardada"),
                                        ),
                                      );

                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MainMenu(),
                                        ),
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
