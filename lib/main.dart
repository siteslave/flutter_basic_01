import 'package:flutter/material.dart';
import 'package:hello_app/screens/add_screen.dart';
import 'package:hello_app/screens/home_screen.dart';

void main() => runApp(HelloApp());

class HelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.pink,
            accentColor: Colors.amber,
            fontFamily: 'Maitree'),
        title: 'Hello app',
        home: HomeScreen(),
        routes: <String, WidgetBuilder>{
          '/add': (BuildContext context) => AddScreen(),
        });
  }
}
