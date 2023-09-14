import 'package:flutter/material.dart';
import 'package:flutter_todolist/provider/tags_provider.dart';
import 'package:flutter_todolist/widget/add_todo_widget.dart';
import 'package:flutter_todolist/model/todo.dart';
import 'package:flutter_todolist/widget/todo_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todolist = [];
  late TagsProvider tagsProvider;

  @override
  void initState() {
    super.initState();
    tagsProvider = Provider.of<TagsProvider>(context, listen: false);
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
      children: tagsProvider.tagList.values.map((tag) {
        return Flexible(
          flex: tag.width,
          child: tag,
        );
      }).toList(),
    );
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
