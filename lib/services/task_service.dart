import 'package:cloud_firestore/cloud_firestore.dart';

class TaskService {

  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask(String title) async {
    await tasks.add({
      'title': title,
      'createdAt': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getTasks() {
    return tasks.orderBy('createdAt').snapshots();
  }

  Future<void> deleteTask(String id) async {
    await tasks.doc(id).delete();
  }
}