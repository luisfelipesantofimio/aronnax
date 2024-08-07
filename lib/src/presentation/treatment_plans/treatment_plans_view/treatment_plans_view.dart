import 'dart:convert';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/io_repository_interface.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/treatment_plans_repository_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
import 'package:aronnax/src/presentation/treatment_plans/treatment_plan_creation/treatment_plan_creation_view.dart';
import 'package:aronnax/src/presentation/treatment_plans/treatment_plans_view/information_container.dart';
import 'package:aronnax/src/presentation/treatment_plans/treatment_plans_view/treatment_plan_list_element.dart';
import 'package:aronnax/src/presentation/widgets/generic_icon_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TreatmentPlansView extends ConsumerWidget {
  const TreatmentPlansView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treatmentPlanList = ref.watch(
      treatmentPlanListProvider(ref.watch(offlineStatusProvider).value!),
    );
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ScreenInformationContainer(),
          Column(
            children: [
              GenericIconButton(
                icon: FontAwesomeIcons.bookOpen,
                title: AppLocalizations.of(context)!.treatmentPlanScreenTitle,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const TreatmentPlanCreationView(null),
                    ),
                  );
                },
              ),
              GenericIconButton(
                icon: FontAwesomeIcons.fileImport,
                title: AppLocalizations.of(context)!
                    .treatmentPlanScreenOptionImport,
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['arnx'],
                  );
                  if (result != null) {
                    TreatmentPlan data = TreatmentPlan.fromJson(
                      jsonDecode(await ref
                              .read(ioRepositoryProvider)
                              .readFromTextFile(
                                  result.files.first.path!, false))['data']
                          .toString(),
                    );
                    ref
                        .read(localDatabaseRepositoryProvider)
                        .insertLocalTreatmentPlan(
                          id: data.id,
                          date: data.creationDate,
                          treatmentTitle: data.title,
                          treatmentDescription: data.description,
                          professionalID: data.creatorId,
                          treatmentData: ref
                              .read(treatmentPlanRepositoryProvider)
                              .encodeTreatmentPlanData(data.sectionsList),
                        );
                    Future(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                              '${AppLocalizations.of(context)!.treatmentPlanScreenImportConfirmation}: ${data.title}'),
                        ),
                      );
                    });
                    ref.invalidate(treatmentPlanListProvider);
                  }
                },
              ),
            ],
          ),
          Column(
            children: [
              treatmentPlanList.when(
                data: (data) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => TreatmentPlanListElement(
                        treatmentPlanData: data[index],
                      ),
                    ),
                  );
                },
                error: (error, stackTrace) => SizedBox(
                  width: 500,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          AppLocalizations.of(context)!.genericErrorMessage,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            ref.invalidate(treatmentPlanListProvider),
                        child: Text(AppLocalizations.of(context)!.tryAgain),
                      ),
                    ],
                  ),
                ),
                loading: () => const CircularProgressIndicator(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
