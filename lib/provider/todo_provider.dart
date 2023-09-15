import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/todo.dart';

class TodoProvider extends ChangeNotifier {
  int index = 0;

  List<Todo> todolist = [];

  void updateIsCompleted(int index) {
    todolist[index-1].updateIsCompleted();
    print('#${index-1} Todo is updated. isCompleted:${todolist[index-1].isCompleted}, isImportant:${todolist[index-1].isImportant}');
    notifyListeners();
  }

  void updateIsImportant(int index) {
    todolist[index-1].updateIsImportant();
    print('#${index-1} Todo is updated. isCompleted:${todolist[index-1].isCompleted}, isImportant:${todolist[index-1].isImportant}');
    notifyListeners();
  }

  void addTodo(String work) {
    todolist.add(Todo(++index, work, false, false));
  }
}
