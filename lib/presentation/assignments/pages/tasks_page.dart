import 'package:flutter/material.dart';
import 'package:flutter_cal/models/Assignment.dart';
import 'package:flutter_cal/models/Task.dart';
import 'package:flutter_cal/presentation/assignments/AssignmentsOperation.dart';
import 'package:flutter_cal/presentation/assignments/TasksOperation.dart';
import 'package:flutter_cal/presentation/assignments/pages/add_tasks_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TasksPage extends StatelessWidget {
  final Assignment _assignment;

  TasksPage(this._assignment);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Provider.of<AssignmentsOperation>(context, listen: false).deleteAssignment(_assignment);
                Navigator.pop(context);
              },
              child: Icon(
                Icons.delete,
                size: 30,
                color: Colors.white,
              ),
              backgroundColor: Colors.blueAccent,
              heroTag: null,
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen(_assignment.id)));
              },
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              backgroundColor: Colors.blueAccent,
              heroTag: null,
            )
          ],
        ),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(10),
                height: 70,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(gradient: _getGradient(_assignment.priority), borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  _assignment.title,
                  style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ))
                /*child: new Text(
                  _assignment.title,
                  style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                )*/
                ),
            //Text(_assignment.title),
            Expanded(child: Consumer<TasksOperation>(
              builder: (context, TasksOperation data, child) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.getTasks.length,
                    itemBuilder: (context, index) {
                      return TaskCard(data.getTasks[index]);
                    });
              },
            ))
          ],
        )
        /*body: Consumer<TasksOperation>(
          builder: (context, TasksOperation data, child) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.getTasks.length,
                itemBuilder: (context, index) {
                  return TaskCard(data.getTasks[index]);
                });
          },
        )*/
        );
  }

  LinearGradient _getGradient(String priority) {
    if (priority == "Medium") return LinearGradient(colors: [Colors.orange[800], Colors.orange[400]]);
    if (priority == "High") return LinearGradient(colors: [Colors.red[800], Colors.red[400]]);
    return LinearGradient(colors: [Colors.green[800], Colors.green[400]]);
  }
}

class TaskCard extends StatefulWidget {
  final Task task;
  TaskCard(this.task);

  @override
  TaskCardState createState() => TaskCardState(this.task);
}

class TaskCardState extends State<TaskCard> {
  final Task task;
  TaskCardState(this.task);

  bool _done = false;

  LinearGradient getGradient() {
    if (_done == true) return LinearGradient(colors: [Colors.green[800], Colors.green[400]]);
    return LinearGradient(colors: [Colors.blue[800], Colors.blue[400]]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        height: 80,
        decoration: BoxDecoration(gradient: getGradient(), borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CheckboxListTile(
              title: Text(task.title, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              value: _done,
              onChanged: (bool value) {
                setState(() {
                  _done = value;
                });
              },
              activeColor: Colors.white,
              checkColor: Colors.black,
            ),
          ],
        ));
  }
}
