import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoService extends ChangeNotifier {
  final todoCollection = FirebaseFirestore.instance.collection("todos");

  void addNewTask(TodoModel model) async {
    var documentReference = await todoCollection.add(model.toMap());
  }

  Stream<List<TodoModel>> fetchData() {
    return todoCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        var todoModel = TodoModel.fromMap(doc.data());
        todoModel.docID = doc.id;
        return todoModel;
      }).toList();
    });
  }

  void updateTask(String? docId, bool? valueUpdate) {
    todoCollection.doc(docId).update({'isDone': valueUpdate});
    notifyListeners();
  }

  void deleteTask(String? docId) {
    todoCollection.doc(docId).delete();
    notifyListeners();
  }
}
