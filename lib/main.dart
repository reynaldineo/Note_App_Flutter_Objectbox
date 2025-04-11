import 'package:flutter/material.dart';
import 'data/objectbox_store.dart';
import 'pages/notes_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initObjectBox();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: NotesPage(),
    );
  }
}
