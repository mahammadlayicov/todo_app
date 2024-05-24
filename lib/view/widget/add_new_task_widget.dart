import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/provider/data_time_provider.dart';
import 'package:todo_app/provider/radio_provider.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/theme/text_styles.dart';
import 'package:todo_app/view/widget/radio_widget.dart';

import 'date_time_widget.dart';
import 'textfield_widget.dart';

class AddNewTaskWidget extends StatefulWidget {
  AddNewTaskWidget({
    super.key,
  });

  @override
  State<AddNewTaskWidget> createState() => _AddNewTaskWidgetState();
}

class _AddNewTaskWidgetState extends State<AddNewTaskWidget> {
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.74,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "New Task Todo",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade300,
          ),
          Text(
            "Title task",
            style: CustomTextStyles.headlineSmallOne,
          ),
          Gap(6),
          TextFieldWidget(
            textEditingController: titleController,
            title: "Add task name",
            maxLines: 1,
          ),
          Gap(12),
          Text(
            "Description",
            style: CustomTextStyles.headlineSmallOne,
          ),
          Gap(6),
          TextFieldWidget(
            textEditingController: descriptionController,
            title: "Description",
            maxLines: 5,
          ),
          Gap(12),
          Text(
            "Category",
            style: CustomTextStyles.headlineSmallOne,
          ),
          Consumer<RadioProvider>(
            builder: (context, radioProvider, child) {
              return Row(
                children: [
                  Expanded(
                    child: RadioWidget(
                      onChangeValue: () {
                        radioProvider.setSelectedValue(1);
                      },
                      value: 1,
                      titleRadio: "Learning",
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: RadioWidget(
                      onChangeValue: () {
                        radioProvider.setSelectedValue(2);
                      },
                      value: 2,
                      titleRadio: "Working",
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: RadioWidget(
                      onChangeValue: () {
                        radioProvider.setSelectedValue(3);
                      },
                      value: 3,
                      titleRadio: "General",
                      color: Colors.green,
                    ),
                  )
                ],
              );
            },
          ),
          Consumer<DateTimeProvider>(
              builder: (context, dateTimeProvider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTimeWidget(
                  ontap: () async {
                    final getDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022, 1, 1),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if (getDate != null) {
                      final format = DateFormat().add_yMd();
                      dateTimeProvider.setSelectedDate(format.format(getDate));
                      print(format.format(getDate));
                    }
                  },
                  title: "Date",
                  valueTitle: dateTimeProvider.dateString,
                  icon: CupertinoIcons.calendar,
                ),
                Gap(20),
                DateTimeWidget(
                  ontap: () async {
                    final getTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (getTime != null) {
                      dateTimeProvider.setSelectedTime(getTime.format(context));
                    }
                  },
                  title: "Time",
                  valueTitle: dateTimeProvider.timeString,
                  icon: CupertinoIcons.clock,
                ),
              ],
            );
          }),
          Gap(20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      foregroundColor: Colors.blue.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(color: Colors.blue.shade700)),
                  child: Text("Cancel"),
                ),
              ),
              Gap(20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final radioProvider =
                        Provider.of<RadioProvider>(context, listen: false);
                    final todoProvider =
                        Provider.of<TodoService>(context, listen: false);
                    final dateTimeProvider =
                        Provider.of<DateTimeProvider>(context, listen: false);
                    String category = "";
                    switch (radioProvider.selectedValue) {
                      case 1:
                        category = 'Learning';
                        break;
                      case 2:
                        category = 'Working';
                        break;
                      case 3:
                        category = 'General';
                        break;
                    }

                    todoProvider.addNewTask(TodoModel(
                        isDone: false,
                        titleTask: titleController.text,
                        description: descriptionController.text,
                        category: category,
                        dateTask: dateTimeProvider.dateString,
                        timeTask: dateTimeProvider.timeString));
                    print("add new task");
                    titleController.clear();
                    descriptionController.clear();
                    radioProvider.setSelectedValue(0);
                    dateTimeProvider.setSelectedDate("dd/mm/yy");
                    dateTimeProvider.setSelectedTime("hh:mm");
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue.shade100,
                    backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Create"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
