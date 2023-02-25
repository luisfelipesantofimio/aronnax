import 'package:aronnax/src/data/database/local_model/local_model.dart';

class Todo {
  final int id;
  final DateTime date;
  final String todo;
  final String? description;
  final String? catergory;
  final int colorCode;
  final bool isComplete;
  Todo({
    required this.id,
    required this.date,
    required this.todo,
    this.description,
    this.catergory,
    required this.colorCode,
    required this.isComplete,
  });

  factory Todo.fromLocalModel(LocalTodo data) {
    return Todo(
      id: data.id,
      date: data.creationDate,
      todo: data.todo,
      colorCode: data.itemColor,
      isComplete: data.isComplete,
    );
  }
}
