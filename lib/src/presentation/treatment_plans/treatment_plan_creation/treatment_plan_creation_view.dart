import 'dart:developer';

import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/treatment_plans_repository_interface.dart';
import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/section.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/treatment_plans/treatment_plan_creation/treatment_plan_metadata_form.dart';
import 'package:aronnax/src/presentation/treatment_plans/treatment_plan_creation/treatment_plan_update_dialog.dart';
import 'package:aronnax/src/presentation/widgets/component_selection/component_selection_item.dart';
import 'package:aronnax/src/presentation/widgets/component_selection/section_metadata_dialog.dart';
import 'package:aronnax/src/presentation/widgets/generic_icon_button.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:aronnax/src/presentation/widgets/treatment_plan_build_widgets/section_list_element.dart';
import 'package:aronnax/src/presentation/widgets/treatment_plan_build_widgets/treatment_plan_list_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreatmentPlanCreationView extends ConsumerStatefulWidget {
  const TreatmentPlanCreationView({Key? key}) : super(key: key);

  @override
  ConsumerState<TreatmentPlanCreationView> createState() =>
      _TreatmentPlanCreationViewState();
}

class _TreatmentPlanCreationViewState
    extends ConsumerState<TreatmentPlanCreationView> {
  bool componentSelectionItemSelected = false;
  int selectedSectionIndex = 0;
  List<Section> sectionList = [];
  String? treatmentPlanTitle;
  String? treatmentPlanDescription;
  @override
  void initState() {
    sectionList.add(
      Section(
        name: 'Phase 1',
        components: [],
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final decodedComponents = ref.watch(
      treatmentPlanComponentDecoding(
        ref
            .read(treatmentPlanRepositoryProvider)
            .encodeTreatmentComponentPlanData(
              sectionList[selectedSectionIndex].components,
            ),
      ),
    );

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: sectionList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    right: 10,
                                  ),
                                  child: SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: SectionListElement(
                                      onDelete: () {
                                        if (sectionList.length > 1) {
                                          sectionList.removeAt(index);
                                          setState(() {});
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                  'There must be at least one section!'),
                                            ),
                                          );
                                        }
                                      },
                                      onEdit: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              SectionMetadataDialog(
                                            sectionData: sectionList[index],
                                            onSelectedMetadata:
                                                (title, description) {
                                              sectionList[index] =
                                                  sectionList[index].copyWith(
                                                name: title,
                                                description: description,
                                              );
                                              setState(() {});
                                            },
                                          ),
                                        );
                                      },
                                      sectionTitle: sectionList[index].name,
                                      sectionDescription:
                                          sectionList[index].description ??
                                              'No description',
                                      onTap: () {
                                        setState(() {
                                          selectedSectionIndex = index;
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => SectionMetadataDialog(
                                  onSelectedMetadata: (title, description) {
                                    sectionList.add(
                                      Section(
                                        name: title,
                                        description: description,
                                        components: [],
                                      ),
                                    );
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: const [
                                Text('Add section'),
                                Icon(
                                  Icons.add,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                      ),
                      decodedComponents.isEmpty
                          ? const Text('Aún no seleccionas componentes')
                          : SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: decodedComponents.length,
                                itemBuilder: (context, index) =>
                                    TreatmentPlanListComponent(
                                  component: decodedComponents[index],
                                  onEdit: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        child:
                                            TreatmentPlanComponentUpdateDialog(
                                          onComponentUpdated: (component) {
                                            setState(() {
                                              sectionList[selectedSectionIndex]
                                                      .components[index] =
                                                  sectionList[
                                                          selectedSectionIndex]
                                                      .components[index]
                                                      .copyWith(
                                                        componentTitle:
                                                            component
                                                                .componentTitle,
                                                        componentDescription:
                                                            component
                                                                .componentDescription,
                                                        componentType: component
                                                            .componentType,
                                                        isRequired: component
                                                            .isRequired,
                                                        optionsList: component
                                                            .optionsList,
                                                      );
                                            });
                                          },
                                          dataToUpdate:
                                              sectionList[selectedSectionIndex]
                                                  .components[index],
                                        ),
                                      ),
                                    );
                                  },
                                  onDelete: () {
                                    sectionList[selectedSectionIndex]
                                        .components
                                        .removeAt(index);
                                    setState(() {});
                                  },
                                  onDuplicate: () {
                                    sectionList[selectedSectionIndex]
                                        .components
                                        .add(
                                          sectionList[selectedSectionIndex]
                                              .components[index],
                                        );
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                Visibility(
                  visible: sectionList.isNotEmpty,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GenericIconButton(
                      icon: Icons.add,
                      title: 'New component',
                      onTap: () {
                        setState(() {
                          componentSelectionItemSelected = true;
                        });
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Visibility(
                    visible: componentSelectionItemSelected,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  componentSelectionItemSelected = false;
                                });
                              },
                            ),
                          ),
                          ComponentSelectionItem(
                            onComponentSelected: (component) {
                              sectionList[selectedSectionIndex]
                                  .components
                                  .add(component);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 104, 104, 104),
                    offset: Offset(3, 0),
                    blurRadius: 6)
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TreatmentPlanMetadataForm(
                    onTitleChanged: (data) {
                      setState(() {
                        treatmentPlanTitle = data;
                      });
                    },
                    onDescriptionChanged: (data) {
                      setState(() {
                        treatmentPlanDescription = data;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      GenericMinimalButton(
                        title: 'Save treatment plan',
                        onTap: () {
                          if (treatmentPlanTitle == null ||
                              treatmentPlanDescription == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                    'You must set a title and description'),
                              ),
                            );
                          } else {
                            ref
                                .read(localDatabaseRepositoryProvider)
                                .insertLocalTreatmentPlan(
                                  date: DateTime.now(),
                                  treatmentTitle:
                                      treatmentPlanTitle ?? 'No data',
                                  treatmentDescription:
                                      treatmentPlanDescription ?? 'No data',
                                  professionalID: ref
                                      .read(globalUserInformationProvider)!
                                      .personalID,
                                  treatmentData: ref
                                      .read(treatmentPlanRepositoryProvider)
                                      .encodeTreatmentPlanData(sectionList),
                                );
                            ref.invalidate(treatmentPlanListProvider);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Treatment plan created!'),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
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
