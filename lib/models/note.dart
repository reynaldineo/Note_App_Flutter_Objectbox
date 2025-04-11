import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  int id;
  String title;
  String content;
  DateTime createdAt;

  Note({
    this.id = 0,
    required this.title,
    required this.content,
    required this.createdAt,
  });
}
