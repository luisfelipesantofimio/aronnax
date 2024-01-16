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
  bool isMessurable = false;
  String? componentTitle;
  String? componentDescription;

  final formKey = GlobalKey<FormState>();
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
                        decoration: const InputDecoration(
                            hintText: 'El enunciado de este campo'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field must not be empty';
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
                      const Text('Descripción'),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Descripción opcional'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field must not be empty';
                          }
                          return null;
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
                            Text(isMessurable
                                ? 'Cuantificable'
                                : 'No cuantificable')
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
                                const Text('Lista de valores'),
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
                                      const Text('Valor: '),
                                      Text(optionTypeList[index]
                                          .value
                                          .toString()),
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
                        title: 'Añadir componente',
                        onTap: () {
                          widget.onComponentSelected(
                            TreatmentPlanComponent(
                              treatmentPlanPhase: widget.sectionIndex,
                              componentType: selectedComponent!.componentType,
                              componentTitle: componentTitle!,
                              messurable: isMessurable,
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
                        },
                      ),
                    ],
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
