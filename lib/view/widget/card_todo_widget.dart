import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/provider/card_todo_color_provider.dart';
import 'package:todo_app/services/todo_service.dart';

class CardTodoWidget extends StatelessWidget {
  CardTodoWidget({super.key, required this.todoModel, TodoModel? todo});
  final TodoModel todoModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Consumer<CardTodoColorProvider>(
            builder: (context, value, child) {
              value.setColor(todoModel);
              return Container(
                decoration: BoxDecoration(
                    color: value.color,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12))),
                width: 20,
              );
            },
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                      onPressed: () {
                        Provider.of<TodoService>(context, listen: false)
                            .deleteTask(todoModel.docID);
                      },
                      icon: Icon(CupertinoIcons.delete)),
                  title: Text(
                    maxLines: 1,
                    todoModel.titleTask,
                    style: TextStyle(
                        decoration: todoModel.isDone
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  subtitle: Text(
                    maxLines: 2,
                    todoModel.description,
                    style: TextStyle(
                        decoration: todoModel.isDone
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  trailing: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      activeColor: Colors.blue.shade600,
                      shape: CircleBorder(),
                      value: todoModel.isDone,
                      onChanged: (value) {
                        Provider.of<TodoService>(context, listen: false)
                            .updateTask(todoModel.docID, value);
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -10),
                  child: Container(
                    child: Column(
                      children: [
                        Divider(
                          thickness: 1.5,
                          color: Colors.grey.shade300,
                        ),
                        Row(
                          children: [
                            Text(todoModel.dateTask),
                            Gap(12),
                            Text(todoModel.timeTask)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
