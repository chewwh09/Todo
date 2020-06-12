import 'package:flutter/material.dart';

import '../models/Event.dart';
import 'Event.dart';

class Day extends StatelessWidget {
  final String weekday;
  final List<Event> events;
  final Function delete;

  Day(this.weekday, this.events, this.delete);
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      subtitle: events.length == 0
          ? Text('No events',)
          : Text(events.length.toString() + " events"),
      leading: CircleAvatar(
        child: Text(
          weekday[0],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      title: Text(weekday, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      children: <Widget>[
        for (int i = 0; i < events.length; i++) EventWidget(events[i], delete)
      ],
    );
  }
}

// return Card(
//     child: Column(
//   children: [
//     Text(weekday),
//     for(int i = 0; i < events.length; i++)
//       EventWidget(events[i], delete)
//   ],
// ));
