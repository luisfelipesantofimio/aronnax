import 'package:aronnax/src/presentation/widgets/todo_creation_dialog/todo_category_item.dart';
import 'package:aronnax/src/presentation/widgets/todo_creation_dialog/todos_color_selection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TodosCreationDialog extends StatefulWidget {
  const TodosCreationDialog({Key? key}) : super(key: key);

  @override
  State<TodosCreationDialog> createState() => _TodosCreationDialogState();
}

class _TodosCreationDialogState extends State<TodosCreationDialog> {
  List<String> currentCategoryList = [];
  String currentCategory = '';
  TextEditingController categoryInputController = TextEditingController();
  Color selectedColor = const Color.fromARGB(255, 205, 203, 203);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: selectedColor,
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Crear tarea',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 400,
                    child: TextField(
                      decoration:
                          const InputDecoration(hintText: 'Nueva tarea'),
                      onChanged: (value) {},
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                maxLines: 3,
                decoration: const InputDecoration(hintText: 'Descripción'),
                onChanged: (value) {},
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: TextField(
                      controller: categoryInputController,
                      decoration: InputDecoration(
                        hintText: 'Categoría',
                        suffix: TextButton(
                          onPressed: () {
                            if (currentCategoryList.length < 3 &&
                                currentCategory.isNotEmpty) {
                              currentCategoryList.add(currentCategory);
                            }
                            categoryInputController.clear();
                            setState(() {});
                          },
                          child: const Text('Añadir'),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          currentCategory = value;
                        });
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: currentCategoryList.isEmpty
                        ? const Text('Aquí verás tus categorías')
                        : ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            scrollDirection: Axis.horizontal,
                            itemCount: currentCategoryList.length,
                            itemBuilder: (context, index) => TodoCategoryItem(
                              title: currentCategoryList[index],
                              itemColor:
                                  const Color.fromARGB(255, 205, 203, 203),
                              onTap: () {
                                currentCategoryList.removeAt(index);
                                setState(() {});
                              },
                            ),
                          ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                children: [
                  TodosColorSelection(
                    icon: FontAwesomeIcons.ban,
                    color: const Color.fromARGB(255, 205, 203, 203),
                    onSelected: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                  ),
                  TodosColorSelection(
                    icon: FontAwesomeIcons.paintbrush,
                    color: const Color.fromARGB(255, 174, 236, 197),
                    onSelected: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                  ),
                  TodosColorSelection(
                    icon: FontAwesomeIcons.paintbrush,
                    color: const Color.fromARGB(255, 145, 215, 224),
                    onSelected: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                  ),
                  TodosColorSelection(
                    icon: FontAwesomeIcons.paintbrush,
                    color: const Color.fromARGB(255, 224, 145, 145),
                    onSelected: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                  ),
                  TodosColorSelection(
                    icon: FontAwesomeIcons.paintbrush,
                    color: const Color.fromARGB(255, 238, 166, 231),
                    onSelected: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                  ),
                  TodosColorSelection(
                    icon: FontAwesomeIcons.paintbrush,
                    color: const Color.fromARGB(255, 222, 225, 167),
                    onSelected: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
