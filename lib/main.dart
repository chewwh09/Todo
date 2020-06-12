import 'package:flutter/material.dart';

import './screens/ToDoScreen.dart';
import './screens/TimeTableScreen.dart';
import './screens/HomePageScreen.dart';
import './screens/CompletedTaskScreen.dart';
import './models/ToDo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final List<ToDo> _userToDo = [
    new ToDo(
        date: DateTime.now(), title: 'Testing1', id: DateTime.now().toString()),
    new ToDo(
        date: DateTime.now(), title: 'Testing2', id: DateTime.now().toString()),
    new ToDo(
        date: DateTime.now(), title: 'Testing3', id: DateTime.now().toString()),
    new ToDo(
        date: DateTime.now(), title: 'Testing4', id: DateTime.now().toString()),
    new ToDo(
        date: DateTime.now(), title: 'Testing5', id: DateTime.now().toString()),
    new ToDo(
        date: DateTime.now(), title: 'Testing6', id: DateTime.now().toString()),
    new ToDo(
        date: DateTime.now(), title: 'Testing7', id: DateTime.now().toString()),
  ];

  final List<ToDo> _completedTask = [
    new ToDo(
        date: DateTime.now(), title: 'DeleteTesting1', id: DateTime.now().toString()),
  ];

  final List<Pair> _days = [
    Pair("Monday", []),
    Pair("TuesDay", []),
    Pair("Wednesday", []),
    Pair("Thursday", []),
    Pair("Friday", []),
    Pair("Saturday", []),
    Pair("Sunday", []),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[100],
        accentColor: Colors.yellow,
        //primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePageScreen(),
      routes: {
        ToDoScreen.routeName: (ctx) => ToDoScreen(_userToDo, _completedTask),
        TimeTableScreen.routeName: (ctx) => TimeTableScreen(_days),
        CompletedTaskScreen.routeName: (ctx) => CompletedTaskScreen(_completedTask),
      },
    );
  }
}
