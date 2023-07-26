import 'package:bloc_test/data/local/todo_list_value.dart';
import 'package:bloc_test/data/model/todo_model.dart';
import 'package:bloc_test/ui/widget/todo_text_input_screen.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var todoListValue = TodoListValue();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TodoTextInputScreen(
                                onTap: (value) {
                                  setState(() {
                                    todoListValue.addData(
                                        todoModel: TodoModel("$value", false));
                                  });
                                },
                              )
                      )
                  );
                },
                child: const SizedBox(
                    width: 100, height: 30, child: Center(child: Text("버튼"))),
              )
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: todoListValue.todoData.length,
              // todoListValue.todoData.length,
              itemBuilder: (BuildContext context, int index) {
                return _ValueButton(
                  title: todoListValue.todoData[index].content,
                  onTap: () {
                    setState(() {
                      todoListValue.changeTodoState(index: index);
                    });
                  },
                  isDone: todoListValue.todoData[index].isDone,
                  onPress: () {
                    setState(() {
                      todoListValue.remove(index: index);
                    });
                  },
                );
              })
        ],
      ),
    );
  }
}

class _ValueButton extends StatelessWidget {
  _ValueButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isDone,
      required this.onPress});

  String title;
  bool isDone;
  void Function() onTap;
  void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.85,
            height: 50,
            color: isDone ? Colors.green : Colors.red,
            child: Center(child: Text(title)),
          ),
        ),
        IconButton(onPressed: onPress, icon: Icon(Icons.delete))
      ],
    );
  }
}
