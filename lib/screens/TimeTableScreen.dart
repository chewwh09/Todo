import 'package:flutter/material.dart';

class TimeTableScreen extends StatelessWidget {
  static const routeName = '/timetable-screen';

  @override
  Widget build(BuildContext context) {
    final timeTableAppBar = AppBar(
      backgroundColor: Colors.grey[200],
      title: Text('Time Table',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      actions: <Widget>[
        FlatButton(
          child: Icon(Icons.add),
          onPressed: () {
            // add new items into the to do list
          },
        )
      ],
    );

    return Scaffold(
      //drawer: AppDrawer(),
      appBar: timeTableAppBar,
    );
  }
}
