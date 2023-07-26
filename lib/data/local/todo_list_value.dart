import 'package:bloc_test/data/model/todo_model.dart';

class TodoListValue {
  List<TodoModel> todoData = [];

  void addData({required TodoModel todoModel}) {
    todoData.add(todoModel);
  }

  void changeTodoState({required int index}) {
    todoData.elementAt(index).isDone
        ? todoData.elementAt(index).isDone = false
        : todoData.elementAt(index).isDone = true;
  }

  void remove({required int index}) {
    todoData.removeAt(index);
  }
}
