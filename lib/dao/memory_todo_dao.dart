import 'package:flutter_todolist/dao/todo_dao.dart';
import 'package:flutter_todolist/model/tag.dart';
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
  List<Todo> getFilteredTodolist(Tag selectedTag) {
    return todolist.where((todo) {
      return _checkTagAndTodoStatus(selectedTag, todo);
    }).toList();
  }

  @override
  int createTodo(String work){
    todolist.add(Todo(++id, work, false, false));
    return id;
  }

  @override
  int updateIsCompleted(int id){
    Todo todo = todolist.where((todo) => todo.id==id).first;
    todo.updateIsCompleted();
    return todo.id;
  }

  @override
  int updateIsImportant(int id){
    Todo todo = todolist.where((todo) => todo.id==id).first;
    todo.updateIsImportant();
    return todo.id;
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