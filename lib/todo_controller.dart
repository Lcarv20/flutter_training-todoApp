import 'package:get/get.dart';

class TodoController extends GetxController {
  List todos = [];
  List todones = [];
  List toNotdones = [];

  void addTodo(String newTodo) {
    todos.add(newTodo);
    update();
  }

  void completeTodo(int todoId) {
    todones.add(todos[todoId]);
    todos.removeAt(todoId);
    update();
  }

  void deleteTodo(int todoId) {
    toNotdones.add(todos[todoId]);
    todos.removeAt(todoId);
    update();
  }
}
