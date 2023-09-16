import 'package:flutter/material.dart';
import 'package:flutter_todolist/provider/tag_provider.dart';
import 'package:flutter_todolist/provider/todo_provider.dart';
import 'package:flutter_todolist/widget/add_todo_widget.dart';
import 'package:flutter_todolist/model/todo.dart';
import 'package:flutter_todolist/widget/todo_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: createAppBar(),
      body: Consumer<TagProvider>(
        builder: (context, tagProvider, child) {
          return Consumer<TodoProvider>(
            builder: (context, todoProvider, child) {
              return Column(
                children: [
                  createTags(tagProvider),
                  Expanded(
                    child: Column(
                      children: [
                        Flexible(
                          flex: 9,
                          child: createTodolist(todoProvider),
                        ),
                        Flexible(
                          flex: 1,
                          child: AddTodoWidget(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Row createTags(TagProvider tagProvider) {
    print('createTags 호출됨!');
    return Row(
      children: tagProvider.tagList.values.map((tag) {
        return Flexible(
          flex: tag.width,
          child: tag,
        );
      }).toList(),
    );
  }

  ListView createTodolist(TodoProvider todoProvider) {
    print('createTodolist 호출됨!');
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 40),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        Todo todo = todoProvider.filteredTodolist[index];
        return TodoWidget(
          id: todo.id,
          work: todo.work,
          isCompleted: todo.isCompleted,
          isImportant: todo.isImportant,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: todoProvider.filteredTodolist.length,
    );
  }

  AppBar createAppBar() {
    print('createappBar 호출됨!');
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
