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
    return Card(
        child: Column(
      children: [
        Text(weekday),
        for(int i = 0; i < events.length; i++) 
          EventWidget(events[i], delete)
      ],
    ));
  }
}
