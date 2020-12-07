import 'package:flutter/material.dart';
import 'package:flutter_cal/models/Assignment.dart';
import 'package:flutter_cal/models/db.dart';

class AssignmentsOperation extends ChangeNotifier {
  List<Map<String, dynamic>> _assignments = new List<Map<String, dynamic>>();
  List<Assignment> _data = new List<Assignment>();

  AssignmentsOperation() {
    DB.init().then((value) => _fetchAssignments());
  }

  void addNewTask(String title, DateTime date, String priority) async {
    Assignment item = Assignment(title: title, date: date, priority: priority);

    await DB.insertAssignment(Assignment.table, item);
    _fetchAssignments();
  }

  void deleteAssignment(Assignment assignment) async {
    await DB.deleteTasks("tasks", assignment.id - 1);
    await DB.deleteAssignment(Assignment.table, assignment);
    _fetchAssignments();
  }

  List<Assignment> get getTasks {
    return _data;
  }

  void _fetchAssignments() async {
    _assignments = await DB.query(Assignment.table);
    _data = _assignments.map((item) => Assignment.fromMap(item)).toList();
    notifyListeners();
  }
}
