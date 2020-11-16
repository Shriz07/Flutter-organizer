import 'package:flutter/material.dart';
import 'package:flutter_cal/presentation/tabs/pages/tabs_page.dart';
import 'package:flutter_cal/models/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            theme: notifier.isDarkTheme ? dark : light,
            home: TabsPage(),
            debugShowCheckedModeBanner: false,
          );
        }));
  }
}
