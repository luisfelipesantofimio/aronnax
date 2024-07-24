import 'package:aronnax/src/data/interfaces/todos_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todosListProvider = FutureProvider(
  (ref) => ref.read(todosRepositoryProvider).getTodosList(ref),
);
