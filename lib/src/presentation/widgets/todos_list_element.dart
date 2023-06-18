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

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Color(todoData.colorCode),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          todoData.todo.length > 30
                              ? todoData.todo
                                  .replaceRange(30, todoData.todo.length, '...')
                              : todoData.todo,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: todoData.isComplete
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(todoData.date),
                        )
                      ],
                    ),
                    todoData.description != null
                        ? SizedBox(
                            width: constraints.maxWidth * 0.6,
                            child: Text(
                              todoData.description!.length > 80
                                  ? todoData.description!.replaceRange(
                                      80, todoData.description!.length, '...')
                                  : todoData.description!,
                            ),
                          )
                        : const Text('No description'),
                    SizedBox(
                      height: 20,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              categoryList[index],
                              style: TextStyle(fontSize: 8),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Column(
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
              )
            ],
          ),
        );
      },
    );
  }
}
