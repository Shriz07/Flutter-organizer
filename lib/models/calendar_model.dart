class CalendarItem {
  static String table = "events";

  String id;
  String name;
  String date;

  CalendarItem({this.id, this.name, this.date});

  /*Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'name': name, 'date': date};

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }*/

  /*static CalendarItem fromMapAlternative(Map<String, dynamic> map) {
    Object _name_id = map['name'];
    return CalendarItem(id: map['id'], name: _name_id.toString(), date: map['date']);
  }*/

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
    };
  }

  CalendarItem.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'],
        date = snapshot['date'];
}
