
import 'package:flutter/material.dart';
import 'package:hello_app/screens/home_screen.dart';

void main() => runApp(HelloApp());

class HelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello app',
      home: HomeScreen(),
    );
  }
}

