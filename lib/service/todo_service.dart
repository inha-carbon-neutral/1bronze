import 'package:flutter_todolist/dao/json_todo_dao.dart';
import 'package:flutter_todolist/dao/memory_todo_dao.dart';
import 'package:flutter_todolist/dao/todo_dao.dart';
import 'package:flutter_todolist/model/tag.dart';
import 'package:flutter_todolist/model/todo.dart';

class TodoService {
  // TodoDao todoDao = MemoryTodoDao();
  TodoDao todoDao = JsonTodoDao();

  Future<List<Todo>> getFilteredTodolist(Tag tag) async {
    final todolist = await todoDao.getTodolist();
    return _getFilteredTodolist(tag, todolist);
  }

  Future<List<Todo>> updateIsCompleted(Tag tag, int id) async {
    final todolist = await todoDao.updateIsCompleted(id);
    return _getFilteredTodolist(tag, todolist);
  }

  Future<List<Todo>> updateIsImportant(Tag tag, int id) async {
    final todolist = await todoDao.updateIsImportant(id);
    return _getFilteredTodolist(tag, todolist);
  }

  Future<List<Todo>> createTodo(Tag tag, String work) async {
    final todolist = await todoDao.createTodo(work);
    return _getFilteredTodolist(tag, todolist);
  }

  Future<List<Todo>> deleteTodo(Tag tag, int id) async {
    final todolist = await todoDao.deleteTodo(id);
    return _getFilteredTodolist(tag, todolist);
  }

  List<Todo> _getFilteredTodolist(Tag tag, List<Todo> todolist) {
    return todolist.where((todo) => _checkTagAndTodoStatus(tag, todo)).toList();
  }

  bool _checkTagAndTodoStatus(Tag tag, Todo todo) {
    if (tag == Tag.all) {
      return true;
    } else if (tag == Tag.incompleted && !todo.isCompleted) {
      return true;
    } else if (tag == Tag.completed && todo.isCompleted) {
      return true;
    } else if (tag == Tag.important && todo.isImportant) {
      return true;
    } else {
      return false;
    }
  }
}
