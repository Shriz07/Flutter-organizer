import 'package:flutter/cupertino.dart';
import 'package:flutter_cal/db.dart';
import 'package:flutter_cal/models/Note.dart';

class NotesOperation extends ChangeNotifier {
  List<Map<String, dynamic>> _notes = new List<Map<String, dynamic>>();
  List<Note> _data = new List<Note>();

  List<Note> get getNotes {
    return _data;
  }

  NotesOperation() {
    DB.init().then((value) => _fetchNotes());
    //_fetchNotes();
  }

  void addNewNote(String title, String description) async {
    Note item = Note(title: title, description: description);

    await DB.insertNote(Note.table, item);
    _fetchNotes();
  }

  void _fetchNotes() async {
    _notes = await DB.query(Note.table);
    _data = _notes.map((item) => Note.fromMap(item)).toList();
    notifyListeners();
  }
}
