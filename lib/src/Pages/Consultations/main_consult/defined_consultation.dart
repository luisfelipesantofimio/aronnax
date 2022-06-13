import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aronnax/src/Pages/Consultations/clinic_history_consultation/verification_dialog.dart';
import 'consultation_form.dart';

class DefinedConsultation extends StatefulWidget {
  const DefinedConsultation({Key? key}) : super(key: key);

  @override
  State<DefinedConsultation> createState() => _DefinedConsultationState();
}

class _DefinedConsultationState extends State<DefinedConsultation> {
  isDataLoaded() {
    if (ShowQuery.isSearchDefined.value == true) {
      return const LoadedData();
    } else {
      return const SorryIsEmpty();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ShowQuery.isSearchDefined,
      builder: (BuildContext context, bool value, Widget? c) {
        return isDataLoaded();
      },
    );
  }
}

class LoadedData extends StatefulWidget {
  const LoadedData({Key? key}) : super(key: key);

  @override
  State<LoadedData> createState() => _LoadedDataState();
}

class _LoadedDataState extends State<LoadedData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 1000,
        height: double.maxFinite,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                  valueListenable: textNames,
                  builder: (BuildContext context, value, c) {
                    return RichText(
                      text: TextSpan(
                        text: "Nombre: ",
                        style: Theme.of(context).textTheme.headline5,
                        children: [
                          TextSpan(
                            text: textNames.value,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ValueListenableBuilder(
                    valueListenable: textLastNames,
                    builder: (BuildContext context, value, widget) {
                      return RichText(
                        text: TextSpan(
                          text: "Apellidos: ",
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                            TextSpan(
                              text: textLastNames.value,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: textID,
                    builder: (BuildContext context, value, widget) {
                      return SelectableText.rich(
                        TextSpan(
                          text: "Númerdo de documento: ",
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                            TextSpan(
                              text: textID.value,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: textBirthDate,
                    builder: (BuildContext context, value, widget) {
                      return RichText(
                        text: TextSpan(
                          text: "Fecha de nacimiento: ",
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                            TextSpan(
                              text: textBirthDate.value,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: textContactNumber,
                    builder: (BuildContext context, value, widget) {
                      return RichText(
                        text: TextSpan(
                          text: "Número de contacto: ",
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                            TextSpan(
                              text: textContactNumber.value,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: textMail,
                    builder: (BuildContext context, value, widget) {
                      return RichText(
                        text: TextSpan(
                          text: "Correo electrónico: ",
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                            TextSpan(
                              text: textMail.value,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: textAdress,
                    builder: (BuildContext context, value, widget) {
                      return RichText(
                        text: TextSpan(
                          text: "Dirección de residencia: ",
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                            TextSpan(
                              text: textAdress.value,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: textCity,
                    builder: (BuildContext context, value, widget) {
                      return RichText(
                        text: TextSpan(
                          text: "Ciudad de residencia: ",
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                            TextSpan(
                              text: textCity.value,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: textState,
                    builder: (BuildContext context, value, widget) {
                      return RichText(
                        text: TextSpan(
                          text: "Departamento de residencia: ",
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                            TextSpan(
                              text: textState.value,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: textEducation,
                    builder: (BuildContext context, value, widget) {
                      return RichText(
                        text: TextSpan(
                          text: "Nivel de educación: ",
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                            TextSpan(
                              text: textEducation.value,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: textOcupation,
                    builder: (BuildContext context, value, widget) {
                      return RichText(
                        text: TextSpan(
                          text: "Ocupación: ",
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                            TextSpan(
                              text: textOcupation.value,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: textInsurance,
                    builder: (BuildContext context, value, widget) {
                      return RichText(
                        text: TextSpan(
                          text: "EPS: ",
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                            TextSpan(
                              text: textInsurance.value,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: textEmergencyName,
                    builder: (BuildContext context, value, widget) {
                      return RichText(
                        text: TextSpan(
                          text: "Nombre del contacto de emergencia: ",
                          style: Theme.of(context).textTheme.headline5,
                          children: [
                            TextSpan(
                              text: textEmergencyName.value,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }),
                ValueListenableBuilder(
                  valueListenable: textEmergencyNumb,
                  builder: (BuildContext context, value, widget) {
                    return RichText(
                      text: TextSpan(
                        text: "Número de contacto de emergencia: ",
                        style: Theme.of(context).textTheme.headline5,
                        children: [
                          TextSpan(
                            text: textEmergencyNumb.value,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextButton(
                child: Text(
                  "Ver historia clínica",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        const VerifyProfessional(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SorryIsEmpty extends StatelessWidget {
  const SorryIsEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No hay nada que mostrar."),
    );
  }
}
