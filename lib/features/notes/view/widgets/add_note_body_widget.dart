import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_18062025/features/notes/domain/note_entity.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({super.key});

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  late final TextEditingController _titleController;
  late final TextEditingController _subtitleController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _subtitleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
             controller: _titleController,
            validator: (value) =>
                value?.isNotEmpty == true ? null : 'Fullfill please',
            decoration: InputDecoration(hintText: 'Title'),
          ),
          TextFormField(
            controller: _subtitleController,
            decoration: InputDecoration(hintText: 'SubTitle'),
          ),
          OutlinedButton(onPressed: _saveNote, child: Text('Save')),
        ],
      ),
    );
  }

  void _saveNote() {
    if (_formKey.currentState!.validate()) {
      // Validate the form
      Navigator.of(context).pop(
        NoteEntity(
          title: _titleController.text,
          subtitle: _subtitleController.text,
          createdAt: DateTime.now(),
        ),
      );
    }
  }
}
