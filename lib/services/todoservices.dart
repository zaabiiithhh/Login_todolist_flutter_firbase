import 'package:cloud_firestore/cloud_firestore.dart';

class Todoservices {
  static Future<void> addtodo({required String task}) async {
    await FirebaseFirestore.instance
        .collection("task")
        .add({'todo': task, 'time': Timestamp.now()});
  }

  static Future<void> deletetodo({required String id}) async {
    await FirebaseFirestore.instance.collection("task").doc(id).delete();
  }

  static Stream<List<Map<String, dynamic>>> gettodo() {
    return FirebaseFirestore.instance
        .collection("task")
        .orderBy('time', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) {
              final data = doc.data();
              return {
                'id': doc.id,
                'todo': data['todo'] ?? '',
                'time': data['time'] ?? Timestamp.now(),
              };
            })
            .where((element) => element['id'] != null)
            .toList());
  }

  static Future<void> updatetodo(
      {required String id, required String text}) async {
    await FirebaseFirestore.instance
        .collection("task")
        .doc(id)
        .update({'todo': text});
  }
}
