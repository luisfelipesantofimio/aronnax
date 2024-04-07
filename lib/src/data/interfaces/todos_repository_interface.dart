import 'package:aronnax/src/data/repositories/todos_repository.dart';
import 'package:aronnax/src/domain/entities/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class TodosRepositoryInterface {
  Future<List<Todo>> getTodosList(Ref ref);

  Future<void> deleteTodo(WidgetRef ref, String todoId);

  Future<void> updateTodoDoneState(WidgetRef ref, String todoId, bool newState);
}

final todosRepositoryProvider = Provider<TodosRepositoryInterface>(
  (ref) => TodosRepository(),
);
