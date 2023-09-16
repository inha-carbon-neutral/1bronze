import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/tag.dart';
import 'package:flutter_todolist/model/todo.dart';
import 'package:flutter_todolist/service/todo_service.dart';
import 'package:flutter_todolist/widget/tag_widget.dart';

class TodoProvider extends ChangeNotifier {
  final Map<Tag, TagWidget> tagList = {};
  late List<Todo> filteredTodolist;
  late final TodoService todoService;

  Tag selectedTag = Tag.all;

  TodoProvider() {
    todoService = TodoService();
    filteredTodolist = todoService.getFilteredTodolist(selectedTag);
    tagList[Tag.all] = const TagWidget(tag: Tag.all, width: 3);
    tagList[Tag.completed] = const TagWidget(tag: Tag.completed, width: 5);
    tagList[Tag.incompleted] = const TagWidget(tag: Tag.incompleted, width: 5);
    tagList[Tag.important] = const TagWidget(tag: Tag.important, width: 5);
  }

  void updateTag(Tag tag) {
    selectedTag = tag;
    notifyListeners();
  }

  void updateIsCompleted(int id) {
    filteredTodolist = todoService.updateIsCompleted(selectedTag, id);
    notifyListeners();
  }

  void updateIsImportant(int id) {
    filteredTodolist = todoService.updateIsImportant(selectedTag, id);
    notifyListeners();
  }

  void addTodo(String work) {
    filteredTodolist = todoService.createTodo(selectedTag, work);
    notifyListeners();
  }
}
