import 'package:flutter/material.dart';
import 'package:flutter_todolist/provider/tags_provider.dart';
import 'package:provider/provider.dart';

class TagWidget extends StatelessWidget {
  final int width;
  final String title;

  const TagWidget({
    super.key,
    required this.width,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final tagsProvider = Provider.of<TagsProvider>(context);
    final isSelected = title == tagsProvider.selectedTag;

    return GestureDetector(
      onTap: () {
        tagsProvider.updateState(title);
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
              title,
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
