import 'package:flutter/material.dart';
import 'Event.dart';

class Day extends StatelessWidget {
  final String weekday;
  final List<Event> events;
  Day(
    this.weekday,
    this.events,
  );
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [Text(weekday), ...events],
    ));
  }
}
