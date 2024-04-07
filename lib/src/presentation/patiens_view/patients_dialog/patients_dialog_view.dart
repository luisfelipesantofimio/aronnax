import 'dart:developer';
import 'dart:io';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/clinic_history_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/io_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/patients_repository_interface.dart';
import 'package:aronnax/src/data/providers/clinic_history_data_provider.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/patient_case_providers.dart';
import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/presentation/case_creation_view/case_creation_dialog.dart';
import 'package:aronnax/src/presentation/clinic_history_form_screen/clinic_history_register_view.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:aronnax/src/presentation/patiens_view/patients_dialog/export_password_dialog.dart';
import 'package:aronnax/src/presentation/patient_case_view/patient_case_view.dart';
import 'package:aronnax/src/presentation/widgets/patient_dialog_text_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class PatientsDialogView extends ConsumerStatefulWidget {
  const PatientsDialogView({super.key, required this.patientData});
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
        //height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.45,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            children: [
              LayoutBuilder(
                builder: (context, constrains) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: constrains.maxWidth * 0.6,
                          child: Text(
                            '${widget.patientData.names} ${widget.patientData.lastNames}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
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
                                  AppMethods().getUserGenderIcon(
                                      widget.patientData.gender),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: constrains.maxWidth * 0.2,
                              child: Text(
                                  '${widget.patientData.city}, ${widget.patientData.state}'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PatientDialogTextBody(
                              title: AppLocalizations.of(context)!
                                  .patientDataTitleID,
                              body: widget.patientData.idNumber.toString(),
                              title2: AppLocalizations.of(context)!
                                  .patientDataTitleContactNumber,
                              body2:
                                  widget.patientData.contactNumber.toString(),
                              constrains: constrains,
                            ),
                            PatientDialogTextBody(
                              constrains: constrains,
                              title: AppLocalizations.of(context)!
                                  .patientDataTitleEmail,
                              body: widget.patientData.mail,
                              title2: AppLocalizations.of(context)!
                                  .patientDataTitleAdress,
                              body2: widget.patientData.adress,
                            ),
                            PatientDialogTextBody(
                              constrains: constrains,
                              title: AppLocalizations.of(context)!
                                  .patientDataTitleEducationalAttainment,
                              body: widget.patientData.education,
                              title2: AppLocalizations.of(context)!
                                  .patientDataTitleOcupation,
                              body2: widget.patientData.ocupation,
                            ),
                            PatientDialogTextBody(
                              constrains: constrains,
                              title: AppLocalizations.of(context)!
                                  .patientDataTitleInsurance,
                              body: widget.patientData.insurance,
                              title2: AppLocalizations.of(context)!
                                  .patientDataTitleEmergencyContactName,
                              body2: widget.patientData.emergencyContactName,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .patientDataTitleEmergencyContactNumber,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
                                Row(
                                  children: [
                                    Text(
                                      widget.patientData.isActive
                                          ? AppLocalizations.of(context)!
                                              .patientDataTitleActiveUser
                                          : AppLocalizations.of(context)!
                                              .patientDataTitleInactiveUser,
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
                                                ref
                                                    .read(offlineStatusProvider)
                                                    .value!);
                                        ref.invalidate(patientsListProvider);
                                      },
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(20),
                                ),
                                IconButton(
                                  tooltip: AppLocalizations.of(context)!
                                      .patientDataExportData,
                                  onPressed: () async {
                                    final sessionData = await ref
                                        .read(patientsRepositoryProvider)
                                        .getPatientSessionsList(
                                            ref, widget.patientData.id);
                                    final clinicHistoryData = await ref
                                        .read(clinicHistoryRepositoryProvider)
                                        .getPatientClinicHistoryFromConsumer(
                                            ref, widget.patientData.id);

                                    final caseData = await ref
                                        .read(patientsRepositoryProvider)
                                        .getPatientCaseListFromConsumer(
                                            ref, widget.patientData.id);
                                    //TODO: Implement compation json encoding
                                    String result = ref
                                        .read(patientsRepositoryProvider)
                                        .encodePatientData(
                                          patientData: widget.patientData,
                                          sessionData: sessionData,
                                          clinicHistory: clinicHistoryData,
                                          caseData: caseData,
                                        );
                                    File contentsToFile = await ref
                                        .read(ioRepositoryProvider)
                                        .exportToTextFile(
                                          fileName:
                                              '${widget.patientData.names}-${widget.patientData.lastNames}-data',
                                          contents: result,
                                          professionalData: ref.read(
                                              globalUserInformationProvider)!,
                                        );
                                    String fileKey =
                                        AppMethods().codeGeneration(32);
                                    ref.read(ioRepositoryProvider).encryptFile(
                                          input: contentsToFile,
                                          encryptionKey: fileKey,
                                        );
                                    Future(() {
                                      String fileName =
                                          contentsToFile.path.split('/').last;
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            ExportPasswordDialog(
                                          fileName: fileName,
                                          password: fileKey,
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        showCloseIcon: true,
                                        duration: const Duration(minutes: 2),
                                        backgroundColor: Colors.green,
                                        content: Text(
                                            AppLocalizations.of(context)!
                                                .patientDataExportConfirmation(
                                                    contentsToFile.path
                                                        .replaceFirst(
                                                            fileName, ''))),
                                      ));
                                    });
                                  },
                                  icon: const Icon(Icons.download),
                                ),
                                IconButton(
                                  tooltip: AppLocalizations.of(context)!
                                      .patientDataDeletePatient,
                                  onPressed: () {
                                    ref
                                        .read(patientsRepositoryProvider)
                                        .deletePatientData(
                                            ref, widget.patientData.id);
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
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
                                                patientData:
                                                    widget.patientData),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .patientDataCreateClinicalHistory,
                                    style: const TextStyle(
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
                                          builder: (context) =>
                                              CaseCreationDialog(
                                                  patientData:
                                                      widget.patientData),
                                        );
                                        ref.invalidate(patientCaseListProvider);
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .patientDataCreateCase,
                                        style: const TextStyle(
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
                                              builder: (context) =>
                                                  PatientCaseView(
                                                      patiendData:
                                                          widget.patientData),
                                            ),
                                          );
                                        },
                                        child: SizedBox(
                                          width: constrains.minWidth * 0.3,
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .patientDataGoToPatientProfile,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          error: (error, stackTrace) => Text(
                              AppLocalizations.of(context)!
                                  .genericErrorMessage),
                          loading: () => const CircularProgressIndicator(),
                        ),
                      ],
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
