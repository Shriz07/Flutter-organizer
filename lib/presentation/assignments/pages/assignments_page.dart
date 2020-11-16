import 'package:flutter/material.dart';
import 'package:flutter_cal/models/theme.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssignmentsPage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => AssignmentsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("To do list"),
        actions: <Widget>[
          Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => IconButton(
                  icon: notifier.isDarkTheme
                      ? FaIcon(
                          FontAwesomeIcons.moon,
                          size: 20,
                          color: Colors.white,
                        )
                      : Icon(Icons.wb_sunny),
                  onPressed: () => {notifier.toggleTheme()}))
        ],
      ),
      body: Center(),
    );
  }
}
