import 'package:flutter/material.dart';
import 'package:flutter_todolist/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class EditTodoPopupWidget extends StatelessWidget {

  final int id;
  final TextEditingController textEditingController = TextEditingController();

  EditTodoPopupWidget({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {

    final todoProvider = context.watch<TodoProvider>();
    String work = todoProvider.getTodo(id).work;
    textEditingController.text = work;

    return AlertDialog(
      content: TextField(
        controller: textEditingController,

        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        decoration: InputDecoration(
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
        backgroundColor: const Color(0xFF1C1C27),
        actions: <Widget>[
          MaterialButton(
            color: Colors.red,
            textColor: Colors.white,
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          MaterialButton(
            color: Colors.green,
            textColor: Colors.white,
            child: const Text('OK'),
            onPressed: () {
              todoProvider.updateWork(textEditingController.text, id);
              Navigator.pop(context);
            },
          ),
        ]);
  }
}
