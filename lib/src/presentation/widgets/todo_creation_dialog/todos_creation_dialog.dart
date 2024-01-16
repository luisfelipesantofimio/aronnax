import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/providers/todos_provider.dart';
import 'package:aronnax/src/presentation/widgets/todo_creation_dialog/todo_category_item.dart';
import 'package:aronnax/src/presentation/widgets/todo_creation_dialog/todos_color_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TodosCreationDialog extends ConsumerStatefulWidget {
  const TodosCreationDialog({super.key});

  @override
  ConsumerState<TodosCreationDialog> createState() =>
      _TodosCreationDialogState();
}

class _TodosCreationDialogState extends ConsumerState<TodosCreationDialog> {
  List<String> currentCategoryList = [];
  String currentCategory = '';
  TextEditingController categoryInputController = TextEditingController();
  Color selectedColor = const Color.fromARGB(255, 221, 221, 221);
  int currentColorIndex = 1;
  String todoTitle = '';
  String? todoDescription;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: selectedColor,
        height: MediaQuery.of(context).size.height * 0.58,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.todoCreateTodoTitle,
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
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .todoCreateTodoPlaceholder),
                      onChanged: (value) {
                        setState(() {
                          todoTitle = value;
                        });
                      },
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
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!
                        .todoCreateTodoDescriptionPlaceholder),
                onChanged: (value) {
                  setState(() {
                    todoDescription = value;
                  });
                },
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
                        hintText: AppLocalizations.of(context)!
                            .todoCreateTodoCategory,
                        suffix: TextButton(
                          onPressed: () {
                            if (currentCategoryList.length < 3 &&
                                currentCategory.isNotEmpty) {
                              currentCategoryList.add(currentCategory);
                            }
                            categoryInputController.clear();
                            setState(() {});
                          },
                          child: Text(
                              AppLocalizations.of(context)!.todoCreateTodoAdd),
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
                        ? Text(AppLocalizations.of(context)!
                            .todoCreateTodoPlaceholder)
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
                    isSelected: currentColorIndex == 1,
                    icon: FontAwesomeIcons.ban,
                    color: const Color.fromARGB(255, 221, 221, 221),
                    onSelected: (color) {
                      setState(() {
                        selectedColor = color;
                        currentColorIndex = 1;
                      });
                    },
                  ),
                  TodosColorSelection(
                    isSelected: currentColorIndex == 2,
                    icon: FontAwesomeIcons.paintbrush,
                    color: const Color.fromARGB(255, 192, 238, 209),
                    onSelected: (color) {
                      setState(() {
                        selectedColor = color;
                        currentColorIndex = 2;
                      });
                    },
                  ),
                  TodosColorSelection(
                    isSelected: currentColorIndex == 3,
                    icon: FontAwesomeIcons.paintbrush,
                    color: const Color.fromARGB(255, 179, 224, 231),
                    onSelected: (color) {
                      setState(() {
                        selectedColor = color;
                        currentColorIndex = 3;
                      });
                    },
                  ),
                  TodosColorSelection(
                    isSelected: currentColorIndex == 4,
                    icon: FontAwesomeIcons.paintbrush,
                    color: const Color.fromARGB(255, 231, 179, 179),
                    onSelected: (color) {
                      setState(() {
                        selectedColor = color;
                        currentColorIndex = 4;
                      });
                    },
                  ),
                  TodosColorSelection(
                    isSelected: currentColorIndex == 5,
                    icon: FontAwesomeIcons.paintbrush,
                    color: const Color.fromARGB(255, 235, 194, 231),
                    onSelected: (color) {
                      setState(() {
                        selectedColor = color;
                        currentColorIndex = 5;
                      });
                    },
                  ),
                  TodosColorSelection(
                    isSelected: currentColorIndex == 6,
                    icon: FontAwesomeIcons.paintbrush,
                    color: const Color.fromARGB(255, 230, 232, 197),
                    onSelected: (color) {
                      setState(() {
                        selectedColor = color;
                        currentColorIndex = 6;
                      });
                    },
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      ref.read(localDatabaseRepositoryProvider).addLocalTodo(
                            date: DateTime.now(),
                            todoTitle: todoTitle,
                            todoDescription: todoDescription,
                            categoryList: currentCategoryList,
                            itemColor: selectedColor,
                            isComplete: false,
                          );
                      ref.invalidate(todosListProvider);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 91, 91, 91),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            AppLocalizations.of(context)!.todoCreateTodoSave,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
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
