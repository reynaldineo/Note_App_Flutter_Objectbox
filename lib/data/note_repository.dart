import 'package:objectbox/objectbox.dart';
import '../models/note.dart';
import 'objectbox_store.dart';

class NoteRepository {
  final Box<Note> _noteBox = store.box<Note>();

  List<Note> getAllNotes() {
    return _noteBox.getAll().reversed.toList();
  }

  void addNote(Note note) {
    _noteBox.put(note);
  }

  void deleteNote(int id) {
    _noteBox.remove(id);
  }

  void updateNote(Note updatedNote) {
    _noteBox.put(updatedNote);
  }
}
