import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/tag.dart';
import 'package:flutter_todolist/provider/tag_provider.dart';
import 'package:flutter_todolist/provider/todo_provider.dart';
import 'package:flutter_todolist/util/util.dart';
import 'package:provider/provider.dart';

class TagWidget extends StatelessWidget {
  final int width;
  final Tag tag;

  const TagWidget({
    super.key,
    required this.width,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final tagProvider = context.watch<TagProvider>();
    final todoProvider = context.watch<TodoProvider>();
    final isSelected = (tag == tagProvider.selectedTag);

    return GestureDetector(
      onTap: () {
        tagProvider.updateState(tag, todoProvider);
      },
      child: Container(
        alignment: Alignment.center,
        color: const Color(0xFF1C1C27),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              Util.capitalizeFirstLetter(tag.name),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? Theme.of(context).highlightColor
                    : Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: isSelected,
              child: Divider(
                height: 0,
                thickness: 3,
                color: Theme.of(context).highlightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
