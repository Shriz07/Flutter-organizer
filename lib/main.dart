import 'package:flutter/material.dart';
import 'package:flutter_cal/calendar.dart';
import 'package:flutter_cal/theme.dart';
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
          home: DefaultTabController(
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
                  Icon(Icons.notes),
                  Calendar(),
                  Icon(Icons.assignment),
                ],
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
