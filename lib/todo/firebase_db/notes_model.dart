import 'package:cloud_firestore/cloud_firestore.dart';

import 'note_model.dart';

class Notes {
  // 1
  String email;
  // 2
  List<Note> notes;
  // 3
  String? referenceId;
  // 4
  Notes(this.email, {required this.notes, this.referenceId});
  // 5
  factory Notes.fromSnapshot(DocumentSnapshot snapshot) {
    final newNotes = Notes.fromJson(snapshot.data() as Map<String, dynamic>);
    newNotes.referenceId = snapshot.reference.id;
    return newNotes;
  }
  // 6
  factory Notes.fromJson(Map<String, dynamic> json) => _notesFromJson(json);
  // 7
  Map<String, dynamic> toJson() => _notesToJson(this);

  @override
  String toString() => 'Notes<$email>';
}

// 1
Notes _notesFromJson(Map<String, dynamic> json) {
  return Notes(json['email'] as String,
      notes: _convertNotes(json['notes'] as List<dynamic>));
}

// 2
List<Note> _convertNotes(List<dynamic> noteMap) {
  final notes = <Note>[];

  for (final note in noteMap) {
    notes.add(Note.fromJson(note
        as Map<String, dynamic> /*as Map<String, dynamic>*/)); //TTTTTTTTTTTTTT
  }
  return notes;
}

// 3
Map<String, dynamic> _notesToJson(Notes instance) => <String, dynamic>{
      'email': instance.email,
      'notes': _noteList(instance.notes),
    };
// 4
List<Map<String, dynamic>>? /*<Map<String, dynamic>>*/ _noteList(
    List<Note>? notes) {
  if (notes == null) {
    return null;
  }
  final noteMap = /*<Map<String, dynamic>>*/ <Map<String, dynamic>>[];
  notes.forEach((note) {
    noteMap.add(note.toJson());
  });
  return noteMap;
}
