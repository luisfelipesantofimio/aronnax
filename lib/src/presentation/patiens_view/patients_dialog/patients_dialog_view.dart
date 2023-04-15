import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/clinic_history_data_provider.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/patient_case_providers.dart';
import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/presentation/case_creation_view/case_creation_dialog.dart';
import 'package:aronnax/src/presentation/clinic_history_form_screen/clinic_history_register_view.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:aronnax/src/presentation/patient_case_view/patient_case_view.dart';
import 'package:aronnax/src/presentation/widgets/patient_dialog_text_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class PatientsDialogView extends ConsumerStatefulWidget {
  const PatientsDialogView({Key? key, required this.patientData})
      : super(key: key);
  final Patient patientData;

  @override
  ConsumerState<PatientsDialogView> createState() => _PatientsDialogViewState();
}

class _PatientsDialogViewState extends ConsumerState<PatientsDialogView> {
  @override
  Widget build(BuildContext context) {
    final clinicHistoryList = ref.watch(
      clinicHistoryListByIdProvider(widget.patientData.id),
    );

    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.45,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: LayoutBuilder(
            builder: (context, constrains) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.patientData.names} ${widget.patientData.lastNames}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              DateFormat('dd/MM/yyyy')
                                  .format(widget.patientData.birthDate),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            Icon(
                              AppMethods()
                                  .getUserGenderIcon(widget.patientData.gender),
                            ),
                          ],
                        ),
                        Text(
                            '${widget.patientData.city}, ${widget.patientData.state}'),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PatientDialogTextBody(
                          title: 'ID',
                          body: widget.patientData.idNumber.toString(),
                          title2: 'Contact number',
                          body2: widget.patientData.contactNumber.toString(),
                          constrains: constrains,
                        ),
                        PatientDialogTextBody(
                          constrains: constrains,
                          title: 'E-mail',
                          body: widget.patientData.mail,
                          title2: 'Adress',
                          body2: widget.patientData.adress,
                        ),
                        PatientDialogTextBody(
                          constrains: constrains,
                          title: 'Educational level',
                          body: widget.patientData.education,
                          title2: 'Ocupation',
                          body2: widget.patientData.ocupation,
                        ),
                        PatientDialogTextBody(
                          constrains: constrains,
                          title: 'Health provider',
                          body: widget.patientData.insurance,
                          title2: 'Emergency contact name',
                          body2: widget.patientData.emergencyContactName,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Emergency contact number',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.patientData.emergencyContactNumber
                                  .toString(),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.patientData.isActive
                                  ? 'Active user'
                                  : 'Inactive user',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Switch(
                              value: widget.patientData.isActive,
                              onChanged: (value) {
                                ref
                                    .read(patientsRepositoryProvider)
                                    .updateLocalPatientActiveState(
                                        ref,
                                        widget.patientData.id,
                                        !widget.patientData.isActive,
                                        ref.read(offlineStatusProvider).value!);
                                ref.invalidate(patientsListProvider);
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                    clinicHistoryList.when(
                      data: (data) => data.isEmpty
                          ? TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ClinicHistoryRegisterView(
                                            patientData: widget.patientData),
                                  ),
                                );
                              },
                              child: const Text(
                                'Create clinic history',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => CaseCreationDialog(
                                          patientData: widget.patientData),
                                    );
                                    ref.invalidate(patientCaseListProvider);
                                  },
                                  child: const Text(
                                    'Create new case',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: data.isNotEmpty,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PatientCaseView(
                                              patiendData: widget.patientData),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Go to current patient information',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      error: (error, stackTrace) =>
                          const Text('There was an error'),
                      loading: () => const CircularProgressIndicator(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
