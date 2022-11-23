import 'package:aronnax/src/Pages/Consultations/clinic_history_consultation/pdf/pdf_export.dart';
import 'package:aronnax/src/Pages/Consultations/clinic_history_consultation/verification_dialog.dart';
import 'package:aronnax/src/Pages/Consultations/consultation_provider/consultations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'clinic_history_data.dart';

var globalPadding = const EdgeInsets.all(30);

class ClinicHistoryView extends ConsumerStatefulWidget {
  const ClinicHistoryView({Key? key}) : super(key: key);

  @override
  ClinicHistoryViewState createState() => ClinicHistoryViewState();
}

class ClinicHistoryViewState extends ConsumerState<ClinicHistoryView> {
  @override
  void didChangeDependencies() {
    ref.watch(globalQueriedClinicHistoryProvider.notifier).getPatientInfo(2);
    currentRegister.value = ref
        .watch(globalQueriedClinicHistoryProvider)
        .map((e) => e.registerCode)
        .toList()
        .single;
    currentDate.value = ref
        .watch(globalQueriedClinicHistoryProvider)
        .map((e) => e.dateTime)
        .toList()
        .single;
    currentConsultationReason.value = ref
        .watch(globalQueriedClinicHistoryProvider)
        .map((e) => e.consultationReason)
        .toList()
        .single;
    currentMentalExamn.value = ref
        .watch(globalQueriedClinicHistoryProvider)
        .map((e) => e.mentalExamn)
        .toList()
        .single;
    currentTreatment.value = ref
        .watch(globalQueriedClinicHistoryProvider)
        .map((e) => e.treatment)
        .toList()
        .single;
    currentMedAntecedents.value = ref
        .watch(globalQueriedClinicHistoryProvider)
        .map((e) => e.medAntecedents)
        .toList()
        .single;
    currentPsyAntecedents.value = ref
        .watch(globalQueriedClinicHistoryProvider)
        .map((e) => e.psyAntecedents)
        .toList()
        .single;
    currentFamilyHistory.value = ref
        .watch(globalQueriedClinicHistoryProvider)
        .map((e) => e.familyHistory)
        .toList()
        .single;
    currentPersonalHistory.value = ref
        .watch(globalQueriedClinicHistoryProvider)
        .map((e) => e.personalHistory)
        .toList()
        .single;
    currentDiagnostic.value = ref
        .watch(globalQueriedClinicHistoryProvider)
        .map((e) => e.diagnostic)
        .toList()
        .single;
    creator.value = ref
        .watch(globalQueriedClinicHistoryProvider)
        .map((e) => e.createdBy)
        .toList()
        .single;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeaderClinicHistoryView(),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: double.maxFinite,
                      width: 1200,
                      child: ListView(
                        controller: ScrollController(),
                        children: [
                          ValueListenableBuilder(
                              valueListenable: currentRegister,
                              builder: (BuildContext context, value, widget) {
                                return Padding(
                                  padding: globalPadding,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Motivo de consulta: \n",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                      children: [
                                        TextSpan(
                                          text: currentConsultationReason.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          ValueListenableBuilder(
                              valueListenable: currentRegister,
                              builder: (BuildContext context, value, widget) {
                                return Padding(
                                  padding: globalPadding,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Exámen mental: \n",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                      children: [
                                        TextSpan(
                                          text: currentMentalExamn.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          ValueListenableBuilder(
                              valueListenable: currentRegister,
                              builder: (BuildContext context, value, widget) {
                                return Padding(
                                  padding: globalPadding,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Antecedentes médicos: \n",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                      children: [
                                        TextSpan(
                                          text: currentMedAntecedents.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          ValueListenableBuilder(
                              valueListenable: currentRegister,
                              builder: (BuildContext context, value, widget) {
                                return Padding(
                                  padding: globalPadding,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Antecedentes psicológicos: \n",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                      children: [
                                        TextSpan(
                                          text: currentPsyAntecedents.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          ValueListenableBuilder(
                              valueListenable: currentRegister,
                              builder: (BuildContext context, value, widget) {
                                return Padding(
                                  padding: globalPadding,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Historia familiar: \n",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                      children: [
                                        TextSpan(
                                          text: currentFamilyHistory.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          ValueListenableBuilder(
                              valueListenable: currentRegister,
                              builder: (BuildContext context, value, widget) {
                                return Padding(
                                  padding: globalPadding,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Historia personal: \n",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                      children: [
                                        TextSpan(
                                          text: currentPersonalHistory.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          ValueListenableBuilder(
                              valueListenable: currentRegister,
                              builder: (BuildContext context, value, widget) {
                                return Padding(
                                  padding: globalPadding,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Impresión diagnística: \n",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                      children: [
                                        TextSpan(
                                          text: currentDiagnostic.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          ValueListenableBuilder(
                              valueListenable: currentRegister,
                              builder: (BuildContext context, value, widget) {
                                return Padding(
                                  padding: globalPadding,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Propuesta de tratamiento: \n",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                      children: [
                                        TextSpan(
                                          text: currentTreatment.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(68, 153, 169, 1),
                    height: double.maxFinite,
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          color: Colors.white,
                          iconSize: 50,
                          tooltip: "Guardar como PDF",
                          onPressed: () {
                            pdfExport();
                          },
                          icon: const Icon(Icons.picture_as_pdf_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: IconButton(
                              tooltip: "Volver",
                              iconSize: 50,
                              color: Colors.white,
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                ref
                                    .read(globalQueriedClinicHistoryProvider
                                        .notifier)
                                    .cleanCurrentClinicHistoryList();
                                setState(() {
                                  isVerified = false;
                                });
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderClinicHistoryView extends StatelessWidget {
  const HeaderClinicHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: const Color.fromRGBO(19, 59, 67, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ValueListenableBuilder(
              valueListenable: currentRegister,
              builder: (BuildContext context, value, widget) {
                return Padding(
                  padding: globalPadding,
                  child: RichText(
                    text: TextSpan(
                      text: "Código de registro: \n",
                      style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: const Color.fromARGB(255, 230, 230, 230),
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: currentRegister.value,
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 230, 230, 230)),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          ValueListenableBuilder(
              valueListenable: currentRegister,
              builder: (BuildContext context, value, widget) {
                return Padding(
                  padding: globalPadding,
                  child: RichText(
                    text: TextSpan(
                      text: "Fecha de creación: \n",
                      style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: const Color.fromARGB(255, 230, 230, 230),
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: currentDate.value,
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 230, 230, 230)),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          ValueListenableBuilder(
              valueListenable: currentRegister,
              builder: (BuildContext context, value, widget) {
                return Padding(
                  padding: globalPadding,
                  child: RichText(
                    text: TextSpan(
                      text: "Profesional: \n",
                      style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: const Color.fromARGB(255, 230, 230, 230),
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: creator.value,
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 230, 230, 230)),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
