import 'package:flutter/material.dart';
import 'package:flutter_cal/models/Task.dart';
import 'package:flutter_cal/models/db.dart';

class TasksOperation extends ChangeNotifier {
  List<Map<String, dynamic>> _tasks = new List<Map<String, dynamic>>();
  List<Task> _data = new List<Task>();

  int _id;

  TasksOperation(int id) {
    this._id = id;
    DB.init().then((value) => _fetchTasks());
  }

  void changeID(int id) {
    this._id = id;
    _fetchTasks();
  }

  void addNewTask(String title, int done) async {
    Task item = Task(id: _id, title: title, done: done);

    await DB.insertTask(Task.table, item);
    _fetchTasks();
  }

  void changeTaskState(Task task) async {
    await DB.updateTask(Task.table, task);
    _fetchTasks();
  }

  void _fetchTasks() async {
    _tasks = await DB.getTasks(_id);
    _data = _tasks.map((item) => Task.fromMap(item)).toList();
    notifyListeners();
  }

  List<Task> get getTasks {
    return _data;
  }
}
