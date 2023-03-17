import 'package:aronnax/src/domain/entities/tratment_plan_entities/component_type.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/option_type.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_component.dart';
import 'package:aronnax/src/domain/entities/tratment_plan_entities/treatment_plan_option.dart';
import 'package:aronnax/src/presentation/widgets/component_selection/compoent_options_dialog.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter/material.dart';

class TreatmentPlanComponentUpdateDialog extends StatefulWidget {
  const TreatmentPlanComponentUpdateDialog({
    Key? key,
    required this.onComponentUpdated,
    this.dataToUpdate,
  }) : super(key: key);
  final Function(TreatmentPlanComponent component) onComponentUpdated;
  final TreatmentPlanComponent? dataToUpdate;
  @override
  State<TreatmentPlanComponentUpdateDialog> createState() =>
      _TreatmentPlanComponentUpdateDialogState();
}

class _TreatmentPlanComponentUpdateDialogState
    extends State<TreatmentPlanComponentUpdateDialog> {
  List<ComponentType> componentTypeList = [
    ComponentType(
      title: 'Campo de texto',
      componentType: 'textField',
    ),
    ComponentType(
      title: 'Escala',
      componentType: 'scale',
    ),
    ComponentType(
      title: 'Selección múltiple',
      componentType: 'selection',
    ),
    ComponentType(
      title: 'Tarea',
      componentType: 'task',
    )
  ];
  List<OptionType> optionTypeList = [];
  ComponentType? selectedComponent;
  bool isRequired = true;
  String? componentTitle;
  String? componentDescription;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setState(() {
      componentTitle = widget.dataToUpdate!.componentTitle;
      componentDescription = widget.dataToUpdate!.componentDescription;
      selectedComponent = componentTypeList.elementAt(
        componentTypeList.indexWhere((element) =>
            element.componentType == widget.dataToUpdate!.componentType),
      );
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
                    const Text('Tipo de campo'),
                    DropdownButtonFormField(
                      hint: const Text('El tipo de campo que diligenciarás'),
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
                    const Text('Título'),
                    TextFormField(
                      initialValue: widget.dataToUpdate!.componentTitle,
                      decoration: const InputDecoration(
                          hintText: 'El enunciado de este campo'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field must not be empty';
                        }
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
                    const Text('Descripción'),
                    TextFormField(
                      initialValue: widget.dataToUpdate!.componentDescription,
                      decoration: const InputDecoration(
                          hintText: 'Descripción opcional'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field must not be empty';
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          componentDescription = value;
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    const Text('Campo requerido'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Switch(
                          value: isRequired,
                          onChanged: (value) => setState(() {
                            isRequired = !isRequired;
                          }),
                        ),
                        Text(isRequired ? 'Requerido' : 'Opcional')
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
                              const Text('Lista de valores'),
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
                                    const Text('Valor: '),
                                    Text(
                                        optionTypeList[index].value.toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('Etiqueta: '),
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
                      title: 'Actualizar componente',
                      onTap: () {
                        widget.onComponentUpdated(
                          TreatmentPlanComponent(
                            componentType: selectedComponent!.componentType,
                            componentTitle: componentTitle!,
                            componentDescription: componentDescription!,
                            isRequired: isRequired,
                            optionsList: optionTypeList
                                .map(
                                  (e) => TreatmentPlanOption(
                                      value: e.value, optionName: e.title),
                                )
                                .toList(),
                          ),
                        );
                        Navigator.pop(context);
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