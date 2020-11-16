import 'package:flutter/material.dart';
import 'package:flutter_cal/models/tab_navigation_item.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<TabNavigationItem> lists = TabNavigationItem.getList(context);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          for (final tabItem in lists) tabItem.page,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: <BottomNavigationBarItem>[
          for (final tabItem in lists)
            BottomNavigationBarItem(
              icon: tabItem.icon,
              title: tabItem.title,
            ),
        ],
      ),
    );
  }
}
