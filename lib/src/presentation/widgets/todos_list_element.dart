import 'package:aronnax/src/data/interfaces/todos_repository_interface.dart';
import 'package:aronnax/src/data/providers/todos_provider.dart';
import 'package:flutter/material.dart';

import 'package:aronnax/src/domain/entities/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TodosListElement extends ConsumerWidget {
  const TodosListElement({
    Key? key,
    required this.todoData,
  }) : super(key: key);
  final Todo todoData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> categoryList =
        todoData.catergory != null ? todoData.catergory!.split(',') : [];

    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(todoData.colorCode),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 118,
                      child: Text(
                        todoData.todo,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          decoration: todoData.isComplete
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy').format(todoData.date),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
              ),
              Visibility(
                visible: categoryList.isNotEmpty,
                child: SizedBox(
                  width: categoryList.isEmpty ? null : 200,
                  height: 20,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(right: 5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 192, 158, 230),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 2, bottom: 2),
                        child: Center(
                          child: Text(
                            categoryList[index],
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
              ),
              Text(
                todoData.description ?? 'Sin descripción',
                style: TextStyle(
                  decoration: todoData.isComplete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: todoData.isComplete
                  ? Colors.grey
                  : const Color.fromARGB(255, 230, 211, 152),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    tooltip:
                        todoData.isComplete ? 'Not complete yet' : 'Complete',
                    onPressed: () {
                      ref.read(todosRepositoryProvider).updateTodoDoneState(
                            ref,
                            todoData.id,
                            !todoData.isComplete,
                          );
                      ref.invalidate(todosListProvider);
                    },
                    icon: todoData.isComplete
                        ? const Icon(Icons.update)
                        : const Icon(Icons.check)),
                IconButton(
                  tooltip: 'Delete task',
                  onPressed: () {
                    ref
                        .read(todosRepositoryProvider)
                        .deleteTodo(ref, todoData.id);
                    ref.invalidate(todosListProvider);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
