class Note {
  // 1
  final int idnote;
  /*final int idnote;*/
  final String title;
  final bool completed;
  final String description;
  // 2
  Note(this.idnote,
      {/*required this.idnote,*/
      required this.title,
      required this.completed,
      required this.description});
  // 3
  factory Note.fromJson(Map<String, dynamic> /*Map<String, dynamic>*/ json) =>
      _noteFromJson(json);
  // 4
  Map<String, dynamic> /*Map<String, dynamic>*/ toJson() => _noteToJson(this);

  @override
  String toString() => 'Note<$idnote>';
}

// 1
Note _noteFromJson(Map<String, dynamic> /*Map<String, dynamic>*/ json) {
  return Note(json['idnote'] as int,
      /*idnote: json['idnote'] as int,*/
      title: json['title'] as String,
      completed: json['completed'] as bool,
      description: json['description'] as String);
}

// 2
Map<String, dynamic> /*Map<String, dynamic>*/ _noteToJson(Note instance) =>
    <String, dynamic> /*<String, dynamic>*/ {
      'idnote': instance.idnote,
      /*'idnote': instance.idnote,*/
      'title': instance.title,
      'completed': instance.completed,
      'description': instance.description
    };
