import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/treatment_plans_repository_interface.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/treatment_plan_providers.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/section.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan.dart';
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
  const TreatmentPlanCreationView(this.treatmentPlanData, {super.key});
  final TreatmentPlan? treatmentPlanData;

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
  List<Widget> decodedComponents = [];
  @override
  void didChangeDependencies() {
    sectionList.add(
      Section(
        name: '${AppLocalizations.of(context)!.treatmentPlansSectionTitle} 1',
        components: [],
      ),
    );
    if (widget.treatmentPlanData != null) {
      sectionList.clear();
      sectionList = widget.treatmentPlanData!.sectionsList;
      setState(() {
        treatmentPlanTitle = widget.treatmentPlanData!.title;
        treatmentPlanDescription = widget.treatmentPlanData!.description;
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    decodedComponents = ref.watch(
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
                            width: MediaQuery.sizeOf(context).width * 0.53,
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
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.15,
                                    child: SectionListElement(
                                      selectedItem:
                                          selectedSectionIndex == index,
                                      editionComponent: true,
                                      onDelete: () {
                                        selectedSectionIndex =
                                            selectedSectionIndex - 1;
                                        if (sectionList.length > 1) {
                                          sectionList.removeAt(index);
                                          setState(() {});
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                AppLocalizations.of(context)!
                                                    .treatmentPlanCreationError,
                                              ),
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
                                              AppLocalizations.of(context)!
                                                  .genericNoDescription,
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
                                    selectedSectionIndex = sectionList.length;
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
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                Text(AppLocalizations.of(context)!
                                    .treatmentPlanCreationTitleAddSection),
                                const Icon(
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
                          ? Text(
                              AppLocalizations.of(context)!
                                  .treatmentPlanCreationErrorNoSelectedComponent,
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: decodedComponents.length,
                                itemBuilder: (context, index) =>
                                    TreatmentPlanListComponent(
                                  editionComponent: true,
                                  component: decodedComponents[index],
                                  onEdit: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        child:
                                            TreatmentPlanComponentUpdateDialog(
                                          sectionIndex: selectedSectionIndex,
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
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      width: MediaQuery.sizeOf(context).width * 0.1,
                      child: GenericIconButton(
                        icon: Icons.add,
                        title: AppLocalizations.of(context)!
                            .treatmentPlanCreationTitleNewComponent,
                        onTap: () {
                          setState(() {
                            componentSelectionItemSelected = true;
                          });
                        },
                      ),
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
                            sectionIndex: selectedSectionIndex,
                            onComponentSelected: (component) {
                              final newComponent = component.copyWith(
                                  id: sectionList[selectedSectionIndex]
                                      .components
                                      .length);
                              sectionList[selectedSectionIndex]
                                  .components
                                  .add(newComponent);
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
                    treatmentPlanData: widget.treatmentPlanData,
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
                        title: widget.treatmentPlanData == null
                            ? AppLocalizations.of(context)!
                                .treatmentPlanCreationButtonTitleSave
                            : AppLocalizations.of(context)!
                                .treatmentPlanCreationButtonTitleUpdate,
                        onTap: () {
                          if (treatmentPlanTitle == null ||
                              treatmentPlanDescription == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  AppLocalizations.of(context)!
                                      .treatmentPlanCreationErrorNoTitleDescription,
                                ),
                              ),
                            );
                          } else {
                            if (widget.treatmentPlanData == null) {
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
                                        .professionalID,
                                    treatmentData: ref
                                        .read(treatmentPlanRepositoryProvider)
                                        .encodeTreatmentPlanData(sectionList),
                                  );
                              ref.invalidate(treatmentPlanListProvider);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(
                                    AppLocalizations.of(context)!
                                        .treatmentPlanCreationMessageTreamentPlanCreated,
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            } else {
                              ref
                                  .read(treatmentPlanRepositoryProvider)
                                  .updateTreatmentPlan(
                                      ref.read(offlineStatusProvider).value!,
                                      widget.treatmentPlanData!,
                                      ref);
                              ref.invalidate(treatmentPlanListProvider);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(AppLocalizations.of(context)!
                                      .treatmentPlanCreationMessageTreamentPlanUpdated),
                                ),
                              );
                            }
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
