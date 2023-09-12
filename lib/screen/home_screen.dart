import 'package:flutter/material.dart';
import 'package:flutter_todolist/widget/add_todo_widget.dart';
import 'package:flutter_todolist/widget/tag_widget.dart';
import 'package:flutter_todolist/model/todo.dart';
import 'package:flutter_todolist/widget/todo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Todo todo1 = Todo('test1', false, false);
  Todo todo2 = Todo('test2', false, false);
  Todo todo3 = Todo('test3', false, false);
  Todo todo4 = Todo('test4', false, false);
  Todo todo5 = Todo('test5', false, false);
  Todo todo6 = Todo('test6', false, false);
  Todo todo7 = Todo('test7', false, false);
  Todo todo8 = Todo('test8', false, false);
  List<Todo> todolist = [];

  @override
  void initState() {
    todolist.add(todo1);
    todolist.add(todo2);
    todolist.add(todo3);
    todolist.add(todo4);
    todolist.add(todo5);
    todolist.add(todo6);
    todolist.add(todo7);
    todolist.add(todo8);
    todolist.add(todo1);
    todolist.add(todo2);
    todolist.add(todo3);
    todolist.add(todo4);
    todolist.add(todo5);
    todolist.add(todo6);
    todolist.add(todo7);
    todolist.add(todo8);
    super.initState();
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
                Flexible(
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
    return const Row(
          children: [
            TagWidget(title: 'All', width: 3,),
            TagWidget(title: 'Completed', width: 5,),
            TagWidget(title: 'Incompleted', width: 5,),
            TagWidget(title: 'Important', width: 5,),
          ],
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
