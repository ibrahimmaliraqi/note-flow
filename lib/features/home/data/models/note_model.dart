import 'package:noteflow/features/home/domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  NoteModel({
    required super.title,
    required super.content,
    required super.createAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'createAt': createAt,
    };
  }

  factory NoteModel.fromEntity(NoteEntity entity) {
    return NoteModel(
      title: entity.title,
      content: entity.content,
      createAt: entity.createAt,
    );
  }
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] as String,
      content: map['content'] as String,
      createAt: map['createAt'] as String,
    );
  }
}
