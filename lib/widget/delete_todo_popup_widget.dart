import 'package:flutter/material.dart';
import 'package:flutter_todolist/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class DeleteTodoPopupWidget extends StatelessWidget {
  final int id;

  const DeleteTodoPopupWidget({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();

    return AlertDialog(
        title: Text(
          'Are you sure to delete?',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
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
              todoProvider.deleteTodo(id);
              Navigator.pop(context);
            },
          ),
        ]);
  }
}
