import 'package:flutter/material.dart';

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
      onPressed: () => print('Floating button clicked!!'),
      child: Icon(Icons.add),
    );

    List pages = [PageOne(), PageTwo(), PageThree()];

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

    return Scaffold(
      appBar: appBar,
      body: pages[currentIndex],
      floatingActionButton: floatingAction,
      bottomNavigationBar: bottomNavBar,
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Image(
          image: AssetImage('assets/images/pic1.jpg'),
        ),
      ),
    );
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
