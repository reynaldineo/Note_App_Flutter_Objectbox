import 'package:flutter/material.dart';
import '../models/note.dart';
import '../widgets/note_tile.dart';
import '../data/note_repository.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _noteRepo = NoteRepository();

  bool isEditing = false;
  int? editingNoteId;

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void addNote() {
    if (titleController.text.isEmpty || contentController.text.isEmpty) return;

    final note = Note(
      id: editingNoteId ?? 0,
      title: titleController.text,
      content: contentController.text,
      createdAt: DateTime.now(),
    );

    if (isEditing) {
      _noteRepo.updateNote(note);
    } else {
      _noteRepo.addNote(note);
    }

    setState(() {
      titleController.clear();
      contentController.clear();
      isEditing = false;
      editingNoteId = null;
    });
  }

  void startEdit(Note note) {
    titleController.text = note.title;
    contentController.text = note.content;
    setState(() {
      isEditing = true;
      editingNoteId = note.id;
    });
  }

  void deleteNote(int id) {
    _noteRepo.deleteNote(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Fetch notes and sort them by createdAt in descending order
    final notes =
        _noteRepo.getAllNotes()
          ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

    return Scaffold(
      appBar: AppBar(title: Text("My Notes")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: "Content"),
            ),
            ElevatedButton(onPressed: addNote, child: Text("Add Note")),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 28),
            Expanded(
              child:
                  notes.isEmpty
                      ? Center(child: Text("No notes yet."))
                      : ListView.builder(
                        itemCount: notes.length,
                        itemBuilder:
                            (_, i) => NoteTile(
                              note: notes[i],
                              onDelete: () => deleteNote(notes[i].id),
                              onEdit: () => startEdit(notes[i]),
                            ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
