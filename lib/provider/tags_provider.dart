import 'package:flutter/material.dart';
import 'package:flutter_todolist/widget/tag_widget.dart';

class TagsProvider extends ChangeNotifier {

  final Map<String, TagWidget> tagList = {};
  String selectedTag = 'All';

  TagsProvider() {
    tagList['All'] = const TagWidget(title: 'All', width: 3);
    tagList['Completed'] = const TagWidget(title: 'Completed', width: 5);
    tagList['Incompleted'] = const TagWidget(title: 'Incompleted', width: 5);
    tagList['Important'] = const TagWidget(title: 'Important', width: 5);
  }

  void updateState(String title) {
    selectedTag = title;
    notifyListeners();
  }
}