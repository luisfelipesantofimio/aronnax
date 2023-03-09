import 'package:aronnax/src/domain/entities/tratment_plan_entities/option_type.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:aronnax/src/presentation/widgets/radio_example_item.dart';
import 'package:aronnax/src/presentation/widgets/scale_example_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComponentOptionsDialog extends StatefulWidget {
  const ComponentOptionsDialog(
      {Key? key, required this.fieldType, required this.optionsSelected})
      : super(key: key);
  final String fieldType;
  final Function(List<OptionType> optionsList) optionsSelected;

  @override
  State<ComponentOptionsDialog> createState() => _ComponentOptionsDialogState();
}

class _ComponentOptionsDialogState extends State<ComponentOptionsDialog> {
  bool isNumericField = true;
  List<OptionType<dynamic>> optionsList = [];
  String? selectedLabel;
  TextEditingController valueInputController = TextEditingController();
  TextEditingController labelInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(isNumericField
                          ? 'Escala numérica'
                          : 'Escala no numérica'),
                      Switch(
                        value: isNumericField,
                        onChanged: (value) {
                          optionsList.clear();
                          setState(() {
                            isNumericField = !isNumericField;
                          });
                        },
                      ),
                    ],
                  ),
                  isNumericField
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                              child: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                    hintText: 'Max values'),
                                onChanged: (value) {
                                  setState(() {
                                    optionsList =
                                        List<OptionType<int>>.generate(
                                            value.isEmpty
                                                ? 1
                                                : int.parse(value),
                                            (int index) => OptionType<int>(
                                                  value: index,
                                                  title: index.toString(),
                                                ),
                                            growable: true);
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: optionsList.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: RadioExampleItem(
                                    title: optionsList[index].value.toString(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: TextField(
                                    controller: labelInputController,
                                    decoration: const InputDecoration(
                                        hintText: 'Write something'),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedLabel = value;
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    optionsList.add(OptionType<String>(
                                      value: selectedLabel!
                                          .replaceAll(' ', '-')
                                          .toLowerCase(),
                                      title: selectedLabel!,
                                    ));
                                    valueInputController.clear();
                                    labelInputController.clear();
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: optionsList.length,
                                itemBuilder: (context, index) =>
                                    ScaleExampleComponent(
                                      valueTitle:
                                          optionsList[index].value.toString(),
                                      labelTitle: optionsList[index].title,
                                      onDelete: () {
                                        optionsList.removeAt(index);
                                        setState(() {});
                                      },
                                    )),
                          ],
                        ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: GenericMinimalButton(
                      title: 'Add options list',
                      onTap: () {
                        widget.optionsSelected(optionsList);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
