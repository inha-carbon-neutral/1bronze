import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/tag.dart';
import 'package:flutter_todolist/widget/tag_widget.dart';

class TagProvider extends ChangeNotifier {

  final Map<Tag, TagWidget> tagList = {};
  Tag selectedTag = Tag.all;

  TagProvider() {
    tagList[Tag.all] = const TagWidget(tag:Tag.all, width: 3);
    tagList[Tag.completed] = const TagWidget(tag:Tag.completed, width: 5);
    tagList[Tag.incompleted] = const TagWidget(tag: Tag.incompleted, width: 5);
    tagList[Tag.important] = const TagWidget(tag: Tag.important, width: 5);
  }

  void updateState(Tag tag) {
    selectedTag = tag;
    notifyListeners();
  }
}