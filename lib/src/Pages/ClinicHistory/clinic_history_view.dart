import 'package:aronnax/src/Pages/ClinicHistory/consultation_provider/clinic_history_data_provider.dart';
import 'package:aronnax/src/Pages/ClinicHistory/pdf/pdf_export.dart';
import 'package:aronnax/src/Pages/ClinicHistory/consultation_provider/consultations_provider.dart';
import 'package:aronnax/src/misc/global_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

var globalPadding = const EdgeInsets.all(30);

class ClinicHistoryView extends ConsumerStatefulWidget {
  const ClinicHistoryView({Key? key}) : super(key: key);

  @override
  ClinicHistoryViewState createState() => ClinicHistoryViewState();
}

class ClinicHistoryViewState extends ConsumerState<ClinicHistoryView> {
  @override
  void didChangeDependencies() {
    Future(
      () {
        ref.read(currentConsultationReason.notifier).update((state) => ref
            .watch(globalQueriedClinicHistoryProvider)
            .map((e) => e.consultationReason)
            .toList()
            .single);
        ref.read(currentMentalExamn.notifier).update((state) => ref
            .watch(globalQueriedClinicHistoryProvider)
            .map((e) => e.mentalExamn)
            .toList()
            .single);
        ref.read(currentTreatment.notifier).update((state) => ref
            .watch(globalQueriedClinicHistoryProvider)
            .map((e) => e.treatment)
            .toList()
            .single);
        ref.read(currentMedAntecedents.notifier).update((state) => ref
            .watch(globalQueriedClinicHistoryProvider)
            .map((e) => e.medAntecedents)
            .toList()
            .single);
        ref.read(currentPsyAntecedents.notifier).update((state) => ref
            .watch(globalQueriedClinicHistoryProvider)
            .map((e) => e.psyAntecedents)
            .toList()
            .single);
        ref.read(currentFamilyHistory.notifier).update((state) => ref
            .watch(globalQueriedClinicHistoryProvider)
            .map((e) => e.familyHistory)
            .toList()
            .single);
        ref.read(currentPersonalHistory.notifier).update((state) => ref
            .watch(globalQueriedClinicHistoryProvider)
            .map((e) => e.personalHistory)
            .toList()
            .single);
        ref.read(currentDiagnostic.notifier).update((state) => ref
            .watch(globalQueriedClinicHistoryProvider)
            .map((e) => e.diagnostic)
            .toList()
            .single);
      },
    );

    // currentDate.value = ref
    //     .watch(globalQueriedClinicHistoryProvider)
    //     .map((e) => e.dateTime)
    //     .toList()
    //     .single;
    // currentConsultationReason.value = ref
    //     .watch(globalQueriedClinicHistoryProvider)
    //     .map((e) => e.consultationReason)
    //     .toList()
    //     .single;
    // currentMentalExamn.value = ref
    //     .watch(globalQueriedClinicHistoryProvider)
    //     .map((e) => e.mentalExamn)
    //     .toList()
    //     .single;
    // currentTreatment.value = ref
    //     .watch(globalQueriedClinicHistoryProvider)
    //     .map((e) => e.treatment)
    //     .toList()
    //     .single;
    // currentMedAntecedents.value = ref
    //     .watch(globalQueriedClinicHistoryProvider)
    //     .map((e) => e.medAntecedents)
    //     .toList()
    //     .single;
    // currentPsyAntecedents.value = ref
    //     .watch(globalQueriedClinicHistoryProvider)
    //     .map((e) => e.psyAntecedents)
    //     .toList()
    //     .single;
    // currentFamilyHistory.value = ref
    //     .watch(globalQueriedClinicHistoryProvider)
    //     .map((e) => e.familyHistory)
    //     .toList()
    //     .single;
    // currentPersonalHistory.value = ref
    //     .watch(globalQueriedClinicHistoryProvider)
    //     .map((e) => e.personalHistory)
    //     .toList()
    //     .single;
    // currentDiagnostic.value = ref
    //     .watch(globalQueriedClinicHistoryProvider)
    //     .map((e) => e.diagnostic)
    //     .toList()
    //     .single;
    // creator.value = ref
    //     .watch(globalQueriedClinicHistoryProvider)
    //     .map((e) => e.createdBy)
    //     .toList()
    //     .single;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const HeaderClinicHistoryView(),
          SizedBox(
            height: height * 0.79,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.75,
                  height: height,
                  child: Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: globalPadding,
                          child: RichText(
                            text: TextSpan(
                              text: "Motivo de consulta: \n",
                              style: Theme.of(context).textTheme.headline5,
                              children: [
                                TextSpan(
                                  text: ref.watch(currentConsultationReason),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: globalPadding,
                          child: RichText(
                            text: TextSpan(
                              text: "Exámen mental: \n",
                              style: Theme.of(context).textTheme.headline5,
                              children: [
                                TextSpan(
                                  text: ref.watch(currentMentalExamn),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: globalPadding,
                          child: RichText(
                            text: TextSpan(
                              text: "Antecedentes médicos: \n",
                              style: Theme.of(context).textTheme.headline5,
                              children: [
                                TextSpan(
                                  text: ref.watch(currentMedAntecedents),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: globalPadding,
                          child: RichText(
                            text: TextSpan(
                              text: "Antecedentes psicológicos: \n",
                              style: Theme.of(context).textTheme.headline5,
                              children: [
                                TextSpan(
                                  text: ref.watch(currentPsyAntecedents),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: globalPadding,
                          child: RichText(
                            text: TextSpan(
                              text: "Historia familiar: \n",
                              style: Theme.of(context).textTheme.headline5,
                              children: [
                                TextSpan(
                                  text: ref.watch(currentFamilyHistory),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: globalPadding,
                          child: RichText(
                            text: TextSpan(
                              text: "Historia personal: \n",
                              style: Theme.of(context).textTheme.headline5,
                              children: [
                                TextSpan(
                                  text: ref.watch(currentPersonalHistory),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: globalPadding,
                          child: RichText(
                            text: TextSpan(
                              text: "Impresión diagnística: \n",
                              style: Theme.of(context).textTheme.headline5,
                              children: [
                                TextSpan(
                                  text: ref.watch(currentDiagnostic),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: globalPadding,
                          child: RichText(
                            text: TextSpan(
                              text: "Propuesta de tratamiento: \n",
                              style: Theme.of(context).textTheme.headline5,
                              children: [
                                TextSpan(
                                  text: ref.watch(currentTreatment),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(68, 153, 169, 1),
                  width: 300,
                  height: MediaQuery.of(context).size.height,
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
                                  .watch(globalQueriedClinicHistoryProvider
                                      .notifier)
                                  .cleanCurrentClinicHistoryList();

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
    );
  }
}

class HeaderClinicHistoryView extends ConsumerStatefulWidget {
  const HeaderClinicHistoryView({Key? key}) : super(key: key);

  @override
  HeaderClinicHistoryViewState createState() => HeaderClinicHistoryViewState();
}

class HeaderClinicHistoryViewState
    extends ConsumerState<HeaderClinicHistoryView> {
  @override
  void didChangeDependencies() {
    Future(() {
      ref.read(currentRegister.notifier).update((state) => ref
          .watch(globalQueriedClinicHistoryProvider)
          .map((e) => e.registerCode)
          .toList()
          .single);
      ref.read(currentDate.notifier).update((state) => ref
          .watch(globalQueriedClinicHistoryProvider)
          .map((e) => e.dateTime)
          .toList()
          .single);
      ref.read(creator.notifier).update((state) => ref
          .watch(globalQueriedClinicHistoryProvider)
          .map((e) => e.createdBy)
          .toList()
          .single);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      color: const Color.fromRGBO(19, 59, 67, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
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
                    text: ref.watch(currentRegister),
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 230, 230, 230)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
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
                    text: ref.watch(currentDate),
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 230, 230, 230)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
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
                    text: ref.watch(creator),
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 230, 230, 230)),
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
