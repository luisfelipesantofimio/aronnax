import 'package:aronnax/src/domain/entities/patient.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:aronnax/src/presentation/patiens_view/patients_dialog/patients_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PatientListElement extends StatelessWidget {
  const PatientListElement({Key? key, required this.patientData})
      : super(key: key);
  final Patient patientData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => PatientsDialogView(patientData: patientData),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(
                255,
                223,
                223,
                223,
              ),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 8,
            bottom: 8,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppMethods().randomColorGenerator()),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Icon(
                              patientData.birthDate.day == DateTime.now().day &&
                                      patientData.birthDate.month ==
                                          DateTime.now().month
                                  ? FontAwesomeIcons.cakeCandles
                                  : FontAwesomeIcons.user,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.5,
                        child: Text(
                          '${patientData.names} ${patientData.lastNames}',
                          style: TextStyle(
                            decoration: patientData.isActive
                                ? TextDecoration.none
                                : TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('dd/MM/yyyy')
                                .format(patientData.birthDate),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${AppMethods().ageCalculator(patientData.birthDate).toString()} años',
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Icon(
                        AppMethods().getUserGenderIcon(patientData.gender),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.4,
                        child: Text(
                          '${patientData.city}, ${patientData.state}',
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
