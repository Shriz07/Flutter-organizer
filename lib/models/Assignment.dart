class Assignment {
  static const String table = "assignments";

  int id;
  String title;
  DateTime date;
  String priority;

  Assignment({this.id, this.title, this.date, this.priority});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'priority': priority,
    };
  }

  static Assignment fromMap(Map<String, dynamic> map) {
    Object _assignment_id = map['title'];
    return Assignment(
      id: map['id'],
      title: _assignment_id.toString(),
      date: DateTime.parse(map['date']),
      priority: map['priority'],
    );
  }
}
