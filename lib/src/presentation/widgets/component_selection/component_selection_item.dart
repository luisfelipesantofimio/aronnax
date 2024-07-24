import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/component_type.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/option_type.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';
import 'package:aronnax/src/presentation/widgets/component_selection/compoent_options_dialog.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';

class ComponentSelectionItem extends StatefulWidget {
  const ComponentSelectionItem({
    super.key,
    required this.onComponentSelected,
    required this.sectionIndex,
  });
  final Function(TreatmentPlanComponent component) onComponentSelected;
  final int sectionIndex;

  @override
  State<ComponentSelectionItem> createState() => _ComponentSelectionItemState();
}

class _ComponentSelectionItemState extends State<ComponentSelectionItem> {
  List<ComponentType> componentTypeList = [];
  List<OptionType> optionTypeList = [];
  ComponentType? selectedComponent;
  bool isRequired = true;
  bool isMessurable = false;
  String? componentTitle;
  String? componentDescription;

  final formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    componentTypeList.addAll(
      [
        ComponentType(
          title:
              AppLocalizations.of(context)!.treatmentPlanComponentTypeTextField,
          componentType: 'textField',
        ),
        ComponentType(
          title: AppLocalizations.of(context)!.treatmentPlanComponentTypeScale,
          componentType: 'scale',
        ),
        ComponentType(
          title:
              AppLocalizations.of(context)!.treatmentPlanComponentTypeSelection,
          componentType: 'selection',
        ),
        ComponentType(
          title: AppLocalizations.of(context)!.treatmentPlanComponentTypeTask,
          componentType: 'task',
        )
      ],
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 104, 104, 104),
                offset: Offset(-2, 0),
                blurRadius: 6)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(
                key: formKey,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!
                            .treatmentPlanComponentSelectionTitle),
                        DropdownButtonFormField(
                          hint: Text(AppLocalizations.of(context)!
                              .treatmentPlanComponentSelectionTitle),
                          items: componentTypeList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.title),
                                ),
                              )
                              .toList(),
                          onChanged: (ComponentType? value) {
                            setState(() {
                              selectedComponent = value;
                            });
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Text(AppLocalizations.of(context)!.genericTitle),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!
                                  .treatmentPlanComponentTitleFieldDescription),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .errorEmptyField;
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              componentTitle = value;
                            });
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Text(AppLocalizations.of(context)!.genericDescription),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!
                                .treatmentPlanComponentDescriptionFieldDescription,
                          ),
                          onChanged: (value) {
                            setState(() {
                              componentDescription = value;
                            });
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Text(AppLocalizations.of(context)!
                            .treatmentPlanComponentRequiredField),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Switch(
                              value: isRequired,
                              onChanged: (value) => setState(() {
                                isRequired = !isRequired;
                              }),
                            ),
                            Text(isRequired
                                ? AppLocalizations.of(context)!
                                    .treatmentPlanCompoentRequiredTrue
                                : AppLocalizations.of(context)!
                                    .treatmentPlanCompoentRequiredFalse)
                          ],
                        ),
                        Visibility(
                          visible: selectedComponent != null &&
                              selectedComponent?.componentType != 'textField',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Switch(
                                value: isMessurable,
                                onChanged: (value) => setState(() {
                                  isMessurable = !isMessurable;
                                }),
                              ),
                              Text(
                                isMessurable
                                    ? AppLocalizations.of(context)!
                                        .treatmentPlanComponentQuantifiableTrue
                                    : AppLocalizations.of(context)!
                                        .treatmentPlanComponentQuantifiableFalse,
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: selectedComponent != null &&
                                  selectedComponent!.componentType == 'scale' ||
                              selectedComponent?.componentType == 'selection',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .treatmentPlanComponentListOfValues,
                                  ),
                                  IconButton(
                                    onPressed: () => showDialog(
                                      context: context,
                                      builder: (context) =>
                                          ComponentOptionsDialog(
                                        fieldType:
                                            selectedComponent!.componentType,
                                        optionsSelected: (optionsList) {
                                          setState(() {
                                            optionTypeList = optionsList;
                                          });
                                        },
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ],
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: optionTypeList.length,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            "${AppLocalizations.of(context)!.treatmentPlanComponentListOfValuesValue}: "),
                                        Text(optionTypeList[index]
                                            .value
                                            .toString()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "${AppLocalizations.of(context)!.treatmentPlanComponentListOfValuesLabel}: "),
                                        Text(optionTypeList[index].title),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        GenericMinimalButton(
                          title: 'Añadir componente',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              widget.onComponentSelected(
                                TreatmentPlanComponent(
                                  treatmentPlanPhase: widget.sectionIndex,
                                  componentType:
                                      selectedComponent!.componentType,
                                  componentTitle: componentTitle!,
                                  messurable: isMessurable,
                                  componentDescription:
                                      componentDescription ?? "",
                                  isRequired: isRequired,
                                  optionsList: optionTypeList
                                      .map(
                                        (e) => TreatmentPlanOption(
                                            value: e.value,
                                            optionName: e.title),
                                      )
                                      .toList(),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
