import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'notes_model.dart';

class DataRepository {
  // 1
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  void addNewNotes(Notes notes, BuildContext ctx) async {
    await collection
        .doc(notes.email.toString()) // <-- Document ID
        .set(notes.toJson())
        .then((value) => //Show SnackBar export
            ScaffoldMessenger.of(ctx).showSnackBar(
                SnackBar(content: Text('Notes exported successfully!'))))
        .catchError((error) => //Show SnackBar export
            ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                content: Text('Add failed: $error!')))); // <-- Your data
    /*await collection.doc(notesID).update(notes.toJson());*/
    /*.then((_) => print('Added'))
        .catchError((error) => print('Add failed: $error'));*/
  }

  // 3
  Future<DocumentReference> addNotes(Notes notes) {
    return collection.add(notes.toJson());
    /*.then((value) {print(value);})
    .catchError((e) => print("Failed"));*/
  }

  // 4
  void updateNotes(Notes notes) async {
    await collection.doc(notes.referenceId).update(notes.toJson());
  }

  // 5
  void deleteNotes(Notes notes) async {
    await collection.doc(notes.referenceId).delete();
  }
}
