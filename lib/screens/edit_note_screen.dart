import 'package:flutter/material.dart';
import 'package:flutter_cal/models/Note.dart';

class EditNoteScreen extends StatelessWidget {
  Note note;

  EditNoteScreen(this.note);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    width: 400,
                    height: 550,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue[800], Colors.blue[400]]),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            note.title,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            note.description,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _NoteButton('Save', () {}),
                  _NoteButton('Discard', () {}),
                  _NoteButton('Delete', () {}),
                ],
              )
            ],
          )),
    );
  }
}

class _NoteButton extends StatelessWidget {
  String _text;
  Function _onPressed;

  _NoteButton(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(_text),
      color: Colors.blueAccent,
      minWidth: 100,
      height: 45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}

/*
  @override
  Widget build(BuildContext context) {
    return Column(
      body: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          width: 400,
          height: 550,
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.blue[800], Colors.blue[400]]),
              borderRadius: BorderRadius.circular(15)),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                note.description,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 17),
              )
            ],
          )),
          ),
          
    );
  }
}*/

/*Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        height: 150,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.blue[800], Colors.blue[400]]),
            borderRadius: BorderRadius.circular(15)),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              note.description,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 17),
            )
          ],
        )
      )
      
    );
  }*/
