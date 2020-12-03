class Task {
  static const String table = "tasks";

  int id;
  String title;
  int done;

  Task({this.id, this.title, this.done});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
    );
  }
}
