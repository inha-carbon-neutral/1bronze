import 'package:flutter_todolist/dao/memory_todo_dao.dart';
import 'package:flutter_todolist/dao/todo_dao.dart';
import 'package:flutter_todolist/model/tag.dart';
import 'package:flutter_todolist/model/todo.dart';

class TodoService {

  TodoDao todoDao = MemoryTodoDao();

  List<Todo> getTodolist() {
    return todoDao.getTodolist();
  }

  List<Todo> getFilteredTodolist(Tag selectedTag) {
    return todoDao.getFilteredTodolist(selectedTag);
  }

  int createTodo(String work) {
    return todoDao.createTodo(work);
  }

  int updateIsCompleted(int id) {
    return todoDao.updateIsCompleted(id);
  }

  int updateIsImportant(int id) {
    return todoDao.updateIsImportant(id);
  }
}