import 'package:aronnax/src/domain/entities/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class TodosRepositoryInterface {
  Future<List<Todo>> getTodosList(WidgetRef ref);

  void deleteTodo(WidgetRef ref, int todoId);
}
