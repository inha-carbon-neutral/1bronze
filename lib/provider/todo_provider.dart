import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/tag.dart';
import 'package:flutter_todolist/model/todo.dart';
import 'package:flutter_todolist/service/todo_service.dart';

class TodoProvider extends ChangeNotifier {

  late final TodoService todoService;
  late final List<Todo> todolist;
  late List<Todo> filteredTodolist;

  TodoProvider() {
    todoService = TodoService();
    todolist = todoService.getTodolist();
    filteredTodolist = todoService.getTodolist();
  }

  void updateFilteredTodolist(Tag tag) {
    filteredTodolist = todoService.getFilteredTodolist(tag);
    notifyListeners();
  }

  void updateIsCompleted(int id) {
    todoService.updateIsCompleted(id);
    notifyListeners();
  }

  void updateIsImportant(int id) {
    todoService.updateIsImportant(id);
    notifyListeners();
  }

  void addTodo(String work) {
    todoService.createTodo(work);
    notifyListeners();
  }
}
