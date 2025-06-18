import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_18062025/features/notes/domain/note_entity.dart';
import 'package:test_18062025/features/notes/view/notes_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: CupertinoColors.inactiveGray),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
        ),
      ),
      home: NotesListView(
        initialNotes: List.generate(
          3,
          (index) => NoteEntity(
            title: 'Stub note #$index',
            subtitle: 'Stub #$index',
            createdAt: DateTime.now(),
          ),
        ),
      ),
    );
  }
}
