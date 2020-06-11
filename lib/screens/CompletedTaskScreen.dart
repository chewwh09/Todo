import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/ToDo.dart';

class CompletedTaskScreen extends StatelessWidget {
  static const routeName = '/IncompletedTaskScreen';

  final List<ToDo> completedTask;

  CompletedTaskScreen(this.completedTask);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        // drawer: AppDrawer(),
        appBar: AppBar(
            backgroundColor: Colors.grey[200],
            title: Text('Completed Tasks',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
        body: ListView(
            children:
                completedTask.map((item) => CompletedItem(item)).toList()));
  }
}

class CompletedItem extends StatelessWidget {
  final ToDo completedItem;

  CompletedItem(this.completedItem);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Card(
          color: Colors.yellow[200],
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          elevation: 5,
          child: ListTile(
            title: Text(
              completedItem.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(completedItem.date),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
