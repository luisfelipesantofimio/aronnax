// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aronnax/src/presentation/widgets/todos_list_element.dart';
import 'package:flutter/material.dart';

import 'package:aronnax/src/domain/entities/todo.dart';

class TodosListView extends StatelessWidget {
  const TodosListView({
    Key? key,
    required this.todosList,
  }) : super(key: key);
  final List<Todo> todosList;

  @override
  Widget build(BuildContext context) {
    return todosList.isEmpty
        ? const Center(
            child: Text('No hay tareas'),
          )
        : ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            itemCount: todosList.length,
            itemBuilder: (context, index) => TodosListElement(
              todoData: todosList[index],
            ),
          );
  }
}
