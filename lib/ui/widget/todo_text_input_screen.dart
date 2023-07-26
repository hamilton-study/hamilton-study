import 'package:flutter/material.dart';

class TodoTextInputScreen extends StatefulWidget {
  TodoTextInputScreen({super.key, required this.onTap});

  void Function(String) onTap;

  @override
  State<TodoTextInputScreen> createState() => _TodoTextInputScreenState();
}

class _TodoTextInputScreenState extends State<TodoTextInputScreen> {
  String content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _GetTextField(
                title: "텍스트 입력",
                labelHint: "todo를 적어주세요",
                content: (value) {
                  setState(() {
                    content = value;
                  });
                }),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.7,
            ),
            InkWell(
                onTap: () {
                  widget.onTap(content);
                  Navigator.pop(context);
                },
                child: Container(
                  child: Center(
                    child: Text("완료"),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class _GetTextField extends StatelessWidget {
  _GetTextField(
      {super.key,
      required this.title,
      required this.labelHint,
      required this.content});

  String title;
  String labelHint;
  void Function(String) content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
            child: TextField(
          onChanged: content,
          decoration: InputDecoration(labelText: labelHint),
        ))
      ],
    );
  }
}
