import 'package:flutter/material.dart';
import 'package:flutter_cal/db.dart';
import 'package:flutter_cal/models/Note.dart';
import 'package:flutter_cal/models/NotesOperation.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String titleText;
    String descriptionText;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Title',
                    hintStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) {
                  titleText = value;
                },
              ),
              Expanded(
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter description',
                      hintStyle: TextStyle(fontSize: 18)),
                  style: TextStyle(fontSize: 20),
                  onChanged: (value) {
                    descriptionText = value;
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  Provider.of<NotesOperation>(context, listen: false)
                      .addNewNote(titleText, descriptionText);
                  Navigator.pop(context);
                },
                color: Colors.blueAccent,
                child: Text('Add new note',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              )
            ],
          )),
    );
  }
}
