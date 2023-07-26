import 'package:flutter/material.dart';

class TodoListWidget extends StatelessWidget {
  TodoListWidget({super.key, required this.content, this.index});

  String content;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(content)
      ],
    );
  }
}
