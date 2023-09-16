import 'package:flutter/material.dart';
import 'package:flutter_todolist/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class AddTodoWidget extends StatelessWidget {
  AddTodoWidget({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 0,
          thickness: 3,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 50,
                child: TextField(
                  controller: textEditingController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: InputDecoration(
                    fillColor:
                        Theme.of(context).highlightColor.withOpacity(0.15),
                    filled: true,
                    hintText: 'Add Task...',
                    hintStyle: TextStyle(
                      color: Theme.of(context).highlightColor.withOpacity(0.5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Transform.scale(
                scale: 1.8,
                child: IconButton(
                  icon: Icon(
                    Icons.add_circle_rounded,
                    color: Theme.of(context).highlightColor,
                  ),
                  onPressed: () {
                    String work = textEditingController.text;
                    if (work.isNotEmpty) {
                      TodoProvider todoProvider = context.read<TodoProvider>();
                      todoProvider.addTodo(work);
                      todoProvider.notifyListeners();
                      textEditingController.clear();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
