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
      final List<Todo> todolist =
          jsonList.map((json) => Todo.fromJson(json)).toList();
      return todolist;
    } else {
      return [];
    }
  }

  @override
  Future<List<Todo>> createTodo(String work) async {
    final prefs = await getPrefs();
    final todolist = await getTodolist();
    final newTodo = Todo(todolist.length + 1, work, false, false);
    todolist.add(newTodo);
    await prefs.setString('todo_list', json.encode(todolist));
    return todolist;
  }

  @override
  Future<List<Todo>> updateWork(int id, String work) async {
    final prefs = await getPrefs();
    final todolist = await getTodolist();
    Todo todo = todolist.where((todo) => todo.id==id).first;
    todo.updateWork(work);
    await prefs.setString('todo_list', json.encode(todolist));
    return todolist;
  }

  @override
  Future<List<Todo>> updateIsCompleted(int id) async {
    final prefs = await getPrefs();
    final todolist = await getTodolist();
    final updatedTodo = todolist.firstWhere((todo) => todo.id == id);
    updatedTodo.updateIsCompleted();
    await prefs.setString('todo_list', json.encode(todolist));
    return todolist;
  }

  @override
  Future<List<Todo>> updateIsImportant(int id) async {
    final prefs = await getPrefs();
    final todolist = await getTodolist();
    final updatedTodo = todolist.firstWhere((todo) => todo.id == id);
    updatedTodo.updateIsImportant();
    await prefs.setString('todo_list', json.encode(todolist));
    return todolist;
  }

  @override
  Future<List<Todo>> deleteTodo(int id) async {
    final prefs = await getPrefs();
    List<Todo> todolist = await getTodolist();
    todolist = todolist.where((todo) => todo.id != id).toList();
    await prefs.setString('todo_list', json.encode(todolist));
    return todolist;
  }
}
