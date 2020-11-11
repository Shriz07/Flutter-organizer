import 'package:flutter/material.dart';
import 'package:flutter_cal/note_list.dart';
import 'note_inherited_widget.dart';

class NoteMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget(NoteList());
  }
}
