import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';

class CardTodoColorProvider extends ChangeNotifier {
  Color color = Colors.white;

  void setColor(TodoModel todoModel) {
    if (todoModel.category == "Learning") {
      color = Colors.blue;
    } else if (todoModel.category == "Working") {
      color = Colors.red;
    } else {
      color = Colors.green;
    }
  }
}
