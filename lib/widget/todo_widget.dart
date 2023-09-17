import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todolist/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoWidget extends StatelessWidget {
  final int id;
  final String work;
  final bool isCompleted;
  final bool isImportant;

  const TodoWidget({
    super.key,
    required this.id,
    required this.work,
    required this.isCompleted,
    required this.isImportant,
  });

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    flex: 2,
                    onPressed: (context) {},
                    backgroundColor: const Color(0xFF1DAAE9),
                    foregroundColor: Theme.of(context).primaryColor,
                    icon: Icons.edit_rounded,
                    label: 'Edit',
                  ),
                  SlidableAction(
                    flex: 2,
                    onPressed: (context) {},
                    backgroundColor: const Color(0xFFF4493D),
                    foregroundColor: Theme.of(context).primaryColor,
                    icon: Icons.delete_rounded,
                    label: 'Delete',
                    borderRadius: const BorderRadius.horizontal(right: Radius.circular(15)),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                        unselectedWidgetColor:
                            Theme.of(context).highlightColor),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
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
                            todoProvider.updateIsCompleted(id);
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 28,
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
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        todoProvider.updateIsImportant(id);
                      },
                      child: Icon(
                        isImportant
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
