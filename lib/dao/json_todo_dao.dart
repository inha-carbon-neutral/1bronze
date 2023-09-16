import 'dart:convert';

import 'package:flutter_todolist/dao/todo_dao.dart';
import 'package:flutter_todolist/model/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JsonTodoDao implements TodoDao {
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<List<Todo>> getTodolist() async {
    final SharedPreferences prefs = await getPrefs();
    final String? jsonStr = prefs.getString('todo_list');
    if (jsonStr != null) {
      final List<dynamic> jsonList = json.decode(jsonStr);
      final List<Todo> todoList =
          jsonList.map((json) => Todo.fromJson(json)).toList();
      return todoList;
    } else {
      return [];
    }
  }

  @override
  Future<List<Todo>> createTodo(String work) async {
    final prefs = await getPrefs();
    final todoList = await getTodolist();
    final newTodo = Todo(todoList.length + 1, work, false, false);
    todoList.add(newTodo);
    await prefs.setString('todo_list', json.encode(todoList));
    return todoList;
  }

  @override
  Future<List<Todo>> updateIsCompleted(int id) async {
    final prefs = await getPrefs();
    final todoList = await getTodolist();
    final updatedTodo = todoList.firstWhere((todo) => todo.id == id);
    updatedTodo.updateIsCompleted();
    await prefs.setString('todo_list', json.encode(todoList));
    return todoList;
  }

  @override
  Future<List<Todo>> updateIsImportant(int id) async {
    final prefs = await getPrefs();
    final todoList = await getTodolist();
    final updatedTodo = todoList.firstWhere((todo) => todo.id == id);
    updatedTodo.updateIsImportant();
    await prefs.setString('todo_list', json.encode(todoList));
    return todoList;
  }
}
