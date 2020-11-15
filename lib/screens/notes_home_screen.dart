import 'package:flutter/material.dart';
import 'package:flutter_cal/models/Note.dart';
import 'package:flutter_cal/models/NotesOperation.dart';
import 'package:flutter_cal/screens/add_note_screen.dart';
import 'package:flutter_cal/screens/edit_note_screen.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotesBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesOperation>(
      create: (BuildContext context) => NotesOperation(),
      child: MaterialApp(
        home: NotesHomeScreen(),
      ),
    );
  }
}

class NotesHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNoteScreen()));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer<NotesOperation>(
        builder: (context, NotesOperation data, child) {
          return ListView.builder(
            itemCount: data.getNotes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditNoteScreen(data.getNotes[index])));
                },
                child: NotesCard(data.getNotes[index]),
              );
            },
          );
        },
      ),
    );
  }
}

class NotesCard extends StatelessWidget {
  final Note note;

  NotesCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        height: 150,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.blue[800], Colors.blue[400]]),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              note.description,
              style: TextStyle(color: Colors.white, fontSize: 17),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ));
  }
}
