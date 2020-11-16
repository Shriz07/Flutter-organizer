import 'package:flutter/material.dart';
import 'package:flutter_cal/presentation/notes/notes_page.dart';
import 'package:flutter_cal/presentation/calendar/pages/calendar_page.dart';
import 'package:flutter_cal/presentation/assignments/pages/assignments_page.dart';

class TabNavigationItem {
  Widget page;
  Widget title;
  Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> getList(BuildContext context) => [
        TabNavigationItem(
            page: NotesPage(),
            icon: Icon(Icons.notes,
                color: Theme.of(context).primaryIconTheme.color),
            title: Text(
              "Notes",
              style: Theme.of(context).primaryTextTheme.bodyText2,
            )),
        TabNavigationItem(
          page: CalendarPage(),
          icon: Icon(Icons.calendar_today,
              color: Theme.of(context).primaryIconTheme.color),
          title: Text(
            "Calendar",
            style: Theme.of(context).primaryTextTheme.bodyText2,
          ),
        ),
        TabNavigationItem(
          page: AssignmentsPage(),
          icon: Icon(Icons.assignment,
              color: Theme.of(context).primaryIconTheme.color),
          title: Text(
            "To do list",
            style: Theme.of(context).primaryTextTheme.bodyText2,
          ),
        ),
      ];
}
