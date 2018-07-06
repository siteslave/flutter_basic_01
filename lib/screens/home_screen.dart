import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'add_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
      title: Text('สวัสดีแอพ'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.home), onPressed: () {}),
        IconButton(icon: Icon(Icons.account_circle), onPressed: () {})
      ],
    );

    Widget floatingAction = FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed('/add'),
      child: Icon(Icons.add),
    );

    List pages = [UserList(), PageTwo(), PageThree()];

    Widget bottomNavBar = BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('หน้าหลัก')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('ข้อมูลผู้ใช้')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('ตั้งค่า')),
        ]);

    Widget drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Satit Rianpit'),
            accountEmail: Text('rianpit@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/med/women/14.jpg'),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/pic1.jpg'))),
          ),
          ListTile(
            title: Text('Menu 1'),
            onTap: () {},
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: pages[currentIndex],
      floatingActionButton: floatingAction,
      bottomNavigationBar: bottomNavBar,
    );
  }
}

class RowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 100.0,
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            height: 100.0,
            color: Colors.green,
          ),
        ),
        Expanded(
          child: Container(
            height: 100.0,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class ColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 100.0,
          color: Colors.red,
        ),
        Container(
          height: 100.0,
          color: Colors.green,
        ),
        Container(
          height: 100.0,
          color: Colors.blue,
        ),
      ],
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  var users;

  Future<Null> fetchUsers() async {
    final response = await http.get('https://randomuser.me/api/?results=20');

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      var jsonResponse = json.decode(response.body);

      setState(() {
        users = jsonResponse['results'];
      });
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, int index) {
        return FlatButton(
          onPressed: () {},
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(users[index]['picture']['medium']),
            ),
            title: Text('''
                ${users[index]['name']['title']}
                ${users[index]['name']['first']} 
                ${users[index]['name']['last']}
                '''),
            subtitle: Text('${users[index]['email']}'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        );
      },
      itemCount: users != null ? users.length : 0,
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget listView = ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          leading: Icon(Icons.notifications_active),
          title: Text('Notifications'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ],
    );

    Widget listBuilder = ListView.builder(
      itemBuilder: (context, int index) {
        return FlatButton(
          onPressed: () {},
          child: ListTile(
            title: Text('Item $index'),
            subtitle: Text('description for item'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        );
      },
      itemCount: 10,
    );

    return listBuilder;
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage('assets/images/pic2.jpg'),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage('assets/images/pic3.jpg'),
      ),
    );
  }
}
