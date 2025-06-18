import 'package:flutter/material.dart';
import 'package:test_18062025/features/notes/domain/note_entity.dart';
import 'package:test_18062025/features/notes/view/widgets/add_note_body_widget.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key, this.initialNotes = const <NoteEntity>[]});

  final List<NoteEntity> initialNotes;

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  late List<NoteEntity> notesList;

  @override
  void initState() {
    super.initState();
    notesList = widget.initialNotes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: constraints,
          child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(notesList[index].title),
              subtitle: notesList[index].subtitle == null
                  ? null
                  : Text(notesList[index].subtitle!),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 25),
            itemCount: notesList.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showAdaptiveDialog<NoteEntity>(
            context: context,
            builder: (context) {
              return AlertDialog(content: AddNoteBody());
            },
          );
          if (result != null) {
            setState(() {
              notesList
                ..add(result)
                ..sort((a, b) => a.createdAt.isBefore(b.createdAt) ? 1 : -1);
            });
          }
        },
        tooltip: 'Add note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
