import 'package:flutter/material.dart';

class SessionsListElement extends StatelessWidget {
  const SessionsListElement(
      {super.key,
      required this.sessionSummary,
      required this.sessionArchievements,
      required this.sessionObjectives,
      required this.sessionID,
      required this.sessionDate,
      required this.sessionProfessional,
      required this.itemIndex});
  final int sessionID;
  final String sessionDate;
  final String sessionProfessional;
  final String sessionSummary;
  final String sessionArchievements;
  final String sessionObjectives;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            5,
          ),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            blurRadius: 3,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sessionDate,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  sessionProfessional,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(
                15,
              ),
            ),
            const Text(
              "Resumen de la sesión:",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(
                5,
              ),
            ),
            Text(
              sessionSummary,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(
                5,
              ),
            ),
            const Text(
              "Logros terapéuticos:",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(
                5,
              ),
            ),
            Text(
              sessionArchievements,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(
                5,
              ),
            ),
            const Text(
              "Objetivos de la sesión:",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(
                5,
              ),
            ),
            Text(
              sessionObjectives,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(
                5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${itemIndex + 1}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
