import 'package:flutter/material.dart';

class TagWidget extends StatefulWidget {
  final int width;
  final String title;

  const TagWidget({
    super.key,
    required this.title,
    required this.width,
  });

  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  late int width;
  late String title;

  @override
  void initState() {
    width = widget.width;
    title = widget.title;
    super.initState();
  }

  @override
  Flexible build(BuildContext context) {
    return Flexible(
      flex: width,
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
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 0,
              thickness: 3,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
