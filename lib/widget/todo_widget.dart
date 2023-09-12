import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  final String work;
  final bool isCompleted;
  final bool isImportant;

  const TodoWidget({
    super.key,
    required this.work,
    required this.isCompleted,
    required this.isImportant,
  });

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  late final String work;
  late bool isCompleted;
  late bool isImportant;

  @override
  void initState() {
    work = widget.work;
    isCompleted = widget.isCompleted;
    isImportant = widget.isImportant;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            data:
            Theme.of(context).copyWith(unselectedWidgetColor: Theme.of(context).highlightColor),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                checkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: false,
                onChanged: (value){},
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(work,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Icon(Icons.star_border_rounded,
            color: Theme.of(context).highlightColor,
          ),
        ],
      ),
    );
  }
}
