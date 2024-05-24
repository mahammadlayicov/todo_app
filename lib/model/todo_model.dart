import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String? docID;
  final String titleTask;
  final String description;
  final String category;
  final String dateTask;
  final String timeTask;
  final bool isDone;

  TodoModel(
      {required this.titleTask,
      required this.description,
      required this.category,
      required this.dateTask,
      required this.timeTask,
      required this.isDone});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'docID': docID});
    result.addAll({'titleTask': titleTask});
    result.addAll({'isDone': isDone});
    result.addAll({'description': description});
    result.addAll({'category': category});
    result.addAll({'dateTask': dateTask});
    result.addAll({'timeTask': timeTask});

    return result;
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      isDone: map['isDone'] as bool,
      titleTask: map['titleTask'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
    );
  }
  factory TodoModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return TodoModel(
        isDone: doc['isDone'],
        titleTask: doc['titleTask'],
        description: doc['description'],
        category: doc['category'],
        dateTask: doc['dateTask'],
        timeTask: doc['timeTask']);
  }
}
