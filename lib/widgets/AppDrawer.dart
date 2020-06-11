import 'package:actual/screens/CompletedTaskScreen.dart';
import 'package:flutter/material.dart';

import '../screens/ToDoScreen.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Menu'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Ongoing Task', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).popAndPushNamed(ToDoScreen.routeName);
            } 
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.assignment_turned_in),
            title: Text('Completed Task', style: TextStyle(fontSize: 16)),
            onTap: () => Navigator.of(context).popAndPushNamed(CompletedTaskScreen.routeName),
          ),
        ],
      ),
    );
  }
}