import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
      title: Text('Welcome to Hello App!'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.home), onPressed: () {}),
        IconButton(icon: Icon(Icons.account_circle), onPressed: () {})
      ],
    );

    Widget floatingAction = FloatingActionButton(
      onPressed: () => print('Floating button clicked!!'),
      child: Icon(Icons.add),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Text('สวัสดีแอพ'),
      ),
      floatingActionButton: floatingAction,
    );
  }
}
