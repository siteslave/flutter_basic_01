import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firstName = 'Satit';
  String lastName = 'Rianpit';

  int age = 38;
  double weight = 50.0;
  double height = 160.0;

  DateTime birthDate = DateTime.now();

  var address = '''
  44 moo 24 Nasinuan, 
  Kantrawichai, Maha Sarkaham
  ''';

  bool isActive = false;
  bool isCancel = true;

  Map map = {'firstName': 'Satit', 'lastName': 'Rianpit', 'age': 38};
  Map<String, double> myMap = {
    'weight': 50.0,
    'height': 160.0,
  };

  List<String> sex = ['Male', 'Female'];
  List<Map> types = [
    {'type': 'admin', 'code': 1},
    {'type': 'guest', 'code': 0}
  ];

  void showName(String firstName, String lastName) {
    print('$firstName $lastName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello app'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // call function
            showName('Satit', 'Rianpit');

            Person person = Person('Flutter awesome!');
            person.showName();

            double bmi = weight / ((height / 100) * (height / 100));

            print('Name: $firstName $lastName');
            print('Age: $age');
            print('====================');
            print('BMI = ${bmi.toString()}');
            print('Address: $address');
          },
          color: Colors.green,
          child: Text('Click me!'),
        ),
      ),
    );
  }
}

class Person {
  String name;

  Person(this.name);

  showName() {
    print('Your name: $name');
  }
}
