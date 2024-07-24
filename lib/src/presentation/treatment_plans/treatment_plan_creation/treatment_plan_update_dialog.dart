import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/component_type.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/option_type.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';
import 'package:aronnax/src/presentation/widgets/component_selection/compoent_options_dialog.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';

class TreatmentPlanComponentUpdateDialog extends StatefulWidget {
  const TreatmentPlanComponentUpdateDialog({
    super.key,
    required this.onComponentUpdated,
    this.dataToUpdate,
    required this.sectionIndex,
  });
  final Function(TreatmentPlanComponent component) onComponentUpdated;
  final TreatmentPlanComponent? dataToUpdate;
  final int sectionIndex;
  @override
  State<TreatmentPlanComponentUpdateDialog> createState() =>
      _TreatmentPlanComponentUpdateDialogState();
}

class _TreatmentPlanComponentUpdateDialogState
    extends State<TreatmentPlanComponentUpdateDialog> {
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
    componentTypeList.addAll([
      ComponentType(
        title: AppLocalizations.of(context)!
            .treatmentPlanUpdateDialogOptionTextField,
        componentType: 'textField',
      ),
      ComponentType(
        title:
            AppLocalizations.of(context)!.treatmentPlanUpdateDialogOptionScale,
        componentType: 'scale',
      ),
      ComponentType(
        title: AppLocalizations.of(context)!
            .treatmentPlanUpdateDialogOptionMultipleSelection,
        componentType: 'selection',
      ),
      ComponentType(
        title:
            AppLocalizations.of(context)!.treatmentPlanUpdateDialogOptionTask,
        componentType: 'task',
      )
    ]);

    selectedComponent = componentTypeList.elementAt(
      componentTypeList.indexWhere((element) =>
          element.componentType == widget.dataToUpdate!.componentType),
    );

    super.didChangeDependencies();
  }

  @override
  void initState() {
    setState(() {
      componentTitle = widget.dataToUpdate!.componentTitle;
      componentDescription = widget.dataToUpdate!.componentDescription;
      optionTypeList = widget.dataToUpdate!.optionsList!
          .map((e) => OptionType(value: e.value, title: e.optionName))
          .toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(AppLocalizations.of(context)!
                        .treatmentPlanUpdateDialogFieldTypeTitle),
                    DropdownButtonFormField(
                      hint: Text(AppLocalizations.of(context)!
                          .treatmentPlanUpdateDialogFieldTypeTitle),
                      items: componentTypeList
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.title),
                            ),
                          )
                          .toList(),
                      value: componentTypeList.elementAt(
                          componentTypeList.indexWhere((element) =>
                              element.componentType ==
                              widget.dataToUpdate!.componentType)),
                      onChanged: (ComponentType? value) {
                        setState(() {
                          selectedComponent = value;
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Text(AppLocalizations.of(context)!
                        .treatmentPlanUpdateDialogFieldTitle),
                    TextFormField(
                      initialValue: widget.dataToUpdate!.componentTitle,
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .treatmentPlanUpdateDialogFieldTitleHint),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!.errorEmptyField;
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
                    Text(AppLocalizations.of(context)!
                        .treatmentPlanUpdateDialogFieldDescription),
                    TextFormField(
                      initialValue: widget.dataToUpdate!.componentDescription,
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .treatmentPlanUpdateDialogFieldDescriptionHint),
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
                        .treatmentPlanUpdateDialogFieldRequiredFieldTitle),
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
                                .treatmentPlanUpdateDialogFieldRequiredFieldOptionRequired
                            : AppLocalizations.of(context)!
                                .treatmentPlanUpdateDialogFieldRequiredFieldOptionOptional)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Switch(
                          value: isMessurable,
                          onChanged: (value) => setState(() {
                            isMessurable = !isMessurable;
                          }),
                        ),
                        Text(isMessurable
                            ? AppLocalizations.of(context)!
                                .treatmentPlanUpdateDialogFieldMessurableTitle
                            : AppLocalizations.of(context)!
                                .treatmentPlanUpdateDialogFieldNotMessurableTitle)
                      ],
                    ),
                    Visibility(
                      visible: selectedComponent!.componentType == 'scale' ||
                          selectedComponent!.componentType == 'selection',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(AppLocalizations.of(context)!
                                  .treatmentPlanUpdateDialogFieldListOfValues),
                              IconButton(
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => ComponentOptionsDialog(
                                    fieldType: selectedComponent!.componentType,
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
                                        '${AppLocalizations.of(context)!.treatmentPlanUpdateDialogFieldListOfValuesValueOption}: '),
                                    Text(
                                        optionTypeList[index].value.toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        '${AppLocalizations.of(context)!.treatmentPlanUpdateDialogFieldListOfValuesLabelOption}: '),
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
                      title: AppLocalizations.of(context)!
                          .treatmentPlanUpdateDialogUpdateButtonTitle,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          widget.onComponentUpdated(
                            TreatmentPlanComponent(
                              treatmentPlanPhase: widget.sectionIndex,
                              componentType: selectedComponent!.componentType,
                              componentTitle: componentTitle!,
                              componentDescription: componentDescription!,
                              isRequired: isRequired,
                              messurable: isMessurable,
                              optionsList: optionTypeList
                                  .map(
                                    (e) => TreatmentPlanOption(
                                        value: e.value, optionName: e.title),
                                  )
                                  .toList(),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
