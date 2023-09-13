import 'package:flutter/material.dart';
import 'package:flutter_todolist/widget/add_todo_widget.dart';
import 'package:flutter_todolist/widget/tag_widget.dart';
import 'package:flutter_todolist/model/todo.dart';
import 'package:flutter_todolist/widget/todo_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final allTag = const TagWidget(title: 'All', width: 3);
  final completedTag = const TagWidget(title: 'Completed', width: 5);
  final incompletedTag = const TagWidget(title: 'Incompleted', width: 5);
  final importantTag = const TagWidget(title: 'Important', width: 5);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todolist = [];
  late Map<String, TagWidget> tagList;
  late TagWidget selectedTag;

  @override
  void initState() {
    tagList = getTagList();
    selectedTag = tagList['All']!;
    super.initState();
  }

  Map<String, TagWidget> getTagList() {
    Map<String, TagWidget> tagList = {};
    tagList['All'] = widget.allTag;
    tagList['Completed'] = widget.completedTag;
    tagList['Incompleted'] = widget.incompletedTag;
    tagList['Important'] = widget.importantTag;
    return tagList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: createAppBar(),
      body: Column(
        children: [
          createTags(),
          Expanded(
            child: Column(
              children: [
                Flexible(
                  flex: 9,
                    child: createTodolist(),
                ),
                const Flexible(
                  flex: 1,
                    child: AddTodoWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row createTags() {
    return Row(
          children: tagList.values.toList(),
        );
  }

  void selectTag(TagWidget tagWidget) {

  }

  ListView createTodolist() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 40),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        var todo = todolist[index];
        return TodoWidget(
          work: todo.work,
          isCompleted: todo.isCompleted,
          isImportant: todo.isImportant,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: todolist.length,
    );
  }

  AppBar createAppBar() {
    return AppBar(
      centerTitle: false,
      foregroundColor: Theme.of(context).primaryColor,
      backgroundColor: const Color(0xFF1C1C27),
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Text(
          'To-Do List',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
