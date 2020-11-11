import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_notebook_page/flutter_notebook_page.dart';
import 'package:flutter_cal/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NotebookPage(
          item1: '8 characters',
          item2: '1 Special character',
          item3: '1 Upper case',
          textStyle: TextStyle(color: Colors.deepPurple, fontSize: 28),
        ),
      ),
    );
  }
}
