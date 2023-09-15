import 'package:flutter/material.dart';
import 'package:flutter_todolist/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoWidget extends StatelessWidget {
  final int index;
  final String work;
  final bool isCompleted;
  final bool isImportant;

  const TodoWidget({
    super.key,
    required this.index,
    required this.work,
    required this.isCompleted,
    required this.isImportant,
  });

  @override
  Widget build(BuildContext context) {

    final todoProvider = context.watch<TodoProvider>();

    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
                unselectedWidgetColor: Theme.of(context).highlightColor),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                checkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: isCompleted,
                onChanged: (value) {
                  print('Tap Detected!');
                  todoProvider.updateIsCompleted(index);
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                work,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Tap Detected!');
              todoProvider.updateIsImportant(index);
            },
            child: Icon(
              isImportant ? Icons.star_rounded : Icons.star_border_rounded,
              color: Theme.of(context).highlightColor,
            ),
          ),
        ],
      ),
    );
  }
}
