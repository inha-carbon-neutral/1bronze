import 'package:flutter/material.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({super.key});

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
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
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).highlightColor.withOpacity(0.15),
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
                child: Icon(
                  Icons.add_circle_rounded,
                  color: Theme.of(context).highlightColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
