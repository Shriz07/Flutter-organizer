import 'package:flutter/material.dart';
import 'package:flutter_cal/models/Assignment.dart';
import 'package:flutter_cal/presentation/assignments/AssignmentsOperation.dart';
import 'package:flutter_cal/presentation/assignments/TasksOperation.dart';
import 'package:flutter_cal/presentation/assignments/pages/add_assignment_screen.dart';
import 'package:flutter_cal/presentation/assignments/pages/tasks_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AssignmentBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AssignmentsOperation>(create: (BuildContext context) => AssignmentsOperation()),
        ChangeNotifierProvider<TasksOperation>(create: (BuildContext context) => TasksOperation(0)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(scaffoldBackgroundColor: Theme.of(context).primaryColor),
        home: AssignmentHomeScreen(),
      ),
    );
  }
}

class AssignmentHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddAssignmentScreen()));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer<AssignmentsOperation>(
        builder: (context, AssignmentsOperation data, child) {
          return ListView.builder(
              itemCount: data.getTasks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Provider.of<TasksOperation>(context, listen: false).changeID(data.getTasks[index].id - 1);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TasksPage(data.getTasks[index])));
                  },
                  child: AssignmentCard(data.getTasks[index]),
                );
              });
        },
      ),
    );
  }
}

class AssignmentCard extends StatelessWidget {
  final Assignment assignment;

  AssignmentCard(this.assignment);

  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        height: 70,
        decoration: BoxDecoration(gradient: getGradient(assignment.priority), borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(
                  assignment.title,
                  style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                new Text(
                  _dateFormatter.format(assignment.date),
                  style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              assignment.priority,
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Color getColor(String priority) {
    if (priority == "Medium") return Colors.yellow;
    if (priority == "High") return Colors.red;
    return Colors.green;
  }

  LinearGradient getGradient(String priority) {
    if (priority == "Medium") return LinearGradient(colors: [Colors.orange[800], Colors.orange[400]]);
    if (priority == "High") return LinearGradient(colors: [Colors.red[800], Colors.red[400]]);
    return LinearGradient(colors: [Colors.green[800], Colors.green[400]]);
  }
}
