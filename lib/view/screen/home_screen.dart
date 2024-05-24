import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/view/screen/setting_screen.dart';
import 'package:todo_app/view/widget/add_new_task_widget.dart';
import 'package:todo_app/view/widget/card_todo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber,
            child: Image.network(
                "https://static.vecteezy.com/system/resources/previews/016/766/342/original/happy-smiling-young-man-avatar-3d-portrait-of-a-man-cartoon-character-people-illustration-isolated-on-transparent-background-png.png"),
          ),
          title: Text("I'am"),
          subtitle: Text("Mahammad Layicov"),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingScreen(),
                ));
              },
              icon: Icon(CupertinoIcons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Task",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Friday, May 24",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () => showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => AddNewTaskWidget(),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      foregroundColor: Colors.blue.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(color: Colors.blue.shade700)),
                  child: Text("+ New Task"),
                )
              ],
            ),
            Gap(20),
            StreamBuilder<List<TodoModel>>(
              stream: TodoService().fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Veriler alınamadı.'),
                  );
                }
                final todoList = snapshot.data;
                return ListView.builder(
                  itemCount: todoList?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CardTodoWidget(
                          todoModel: todoList![index],
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
