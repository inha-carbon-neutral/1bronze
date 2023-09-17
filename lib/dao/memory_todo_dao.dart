import 'package:flutter_todolist/dao/todo_dao.dart';
import 'package:flutter_todolist/model/todo.dart';

class MemoryTodoDao implements TodoDao {

  /* MemoryTodoDao 싱글톤으로 관리 */
  static final MemoryTodoDao _memoryTodoDao = MemoryTodoDao._internal();
  factory MemoryTodoDao() {
    return _memoryTodoDao;
  }
  MemoryTodoDao._internal();

  int id = 0;
  List<Todo> todolist = [];

  @override
  List<Todo> getTodolist() {
    return todolist;
  }

  @override
  List<Todo> createTodo(String work){
    todolist.add(Todo(++id, work, false, false));
    return todolist;
  }

  @override
  List<Todo> updateIsCompleted(int id){
    Todo todo = todolist.where((todo) => todo.id==id).first;
    todo.updateIsCompleted();
    return todolist;
  }

  @override
  List<Todo> updateIsImportant(int id){
    Todo todo = todolist.where((todo) => todo.id==id).first;
    todo.updateIsImportant();
    return todolist;
  }

  @override
  List<Todo> deleteTodo(int id){
    todolist = todolist.where((todo) => todo.id != id).toList();
    return todolist;
  }
}