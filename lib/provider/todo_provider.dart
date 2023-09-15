import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todolist = [
    Todo(0, 'work0 (false, false)', false, false),
    Todo(1, 'work1 (false, true)', false, true),
    Todo(2, 'work2 (true, false)', true, false),
    Todo(3, 'work3 (true, true)', true, true),
  ];

  void updateIsCompleted(int index) {
    todolist[index].updateIsCompleted();
    print('#${index} Todo is updated. isCompleted:${todolist[index].isCompleted}, isImportant:${todolist[index].isImportant}');
    notifyListeners();
  }

  void updateIsImportant(int index) {
    todolist[index].updateIsImportant();
    print('#${index} Todo is updated. isCompleted:${todolist[index].isCompleted}, isImportant:${todolist[index].isImportant}');
    notifyListeners();
  }
}