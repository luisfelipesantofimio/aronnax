import 'package:aronnax/src/data/database/local_model/local_model.dart';
import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/todos_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aronnax/src/domain/entities/todo.dart';

class TodosRepository implements TodosRepositoryInterface {
  @override
  Future<void> deleteTodo(WidgetRef ref, String todoId) async {
    ref.read(localDatabaseRepositoryProvider).deleteTodo(todoId);
  }

  @override
  Future<List<Todo>> getTodosList(Ref ref) async {
    List<LocalTodo> todosList =
        await ref.read(localDatabaseRepositoryProvider).getLocalTodos();

    return todosList.map((e) => Todo.fromLocalModel(e)).toList();
  }

  @override
  Future<void> updateTodoDoneState(
      WidgetRef ref, String todoId, bool newState) {
    return ref
        .read(localDatabaseRepositoryProvider)
        .updateTodoState(todoId, newState);
  }
}
