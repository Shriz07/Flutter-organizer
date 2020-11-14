import 'package:flutter/material.dart';
import 'package:flutter_cal/calendar.dart';
import 'package:flutter_cal/models/NotesOperation.dart';
import 'package:flutter_cal/screens/notes_home_screen.dart';
import 'package:flutter_cal/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
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
            body: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: AppBar(
                    bottom: TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.notes)),
                        Tab(icon: Icon(Icons.calendar_today)),
                        Tab(icon: Icon(Icons.assignment)),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    ChangeNotifierProvider<NotesOperation>(
                      create: (context) => NotesOperation(),
                      child: MaterialApp(
                        home: NotesHomeScreen(),
                      ),
                    ),
                    //NotesHomeScreen(),
                    Calendar(),
                    Icon(Icons.assignment),
                  ],
                ),
              ),
            ),
          ),

          debugShowCheckedModeBanner: false,
          theme: notifier.isDarkTheme ? dark : light,
          //home: Calendar(),
        );
      }),
    );
  }
}
