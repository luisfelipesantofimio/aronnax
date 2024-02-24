import 'package:aronnax/src/data/providers/patients_provider.dart';
import 'package:aronnax/src/presentation/widgets/patiens_widgets/patient_list_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientsList extends ConsumerWidget {
  const PatientsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientsData = ref.watch(patientsListProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    final cellWidth = MediaQuery.of(context).size.width * 0.35;
    final crossAxisCount = (screenWidth / cellWidth).floor();

    return patientsData.when(
      data: (data) {
        return GridView.builder(
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PatientListElement(
              patientData: data[index],
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: MediaQuery.of(context).size.height * 0.2,
            crossAxisCount: crossAxisCount,
          ),
        );
      },
      error: (error, stackTrace) =>
          const Text('There was an error loading the information'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
