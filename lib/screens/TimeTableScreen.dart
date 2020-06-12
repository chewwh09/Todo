import 'package:flutter/material.dart';

import '../models/Event.dart';
import '../models/Day.dart';
import '../models/NewEvent.dart';

class TimeTableScreen extends StatefulWidget {
  static const routeName = '/TimeTableScreen';

  
  final List<Pair> days;
  TimeTableScreen(this.days);
  @override
  _TimeTableState createState() => _TimeTableState(days);

}

class _TimeTableState extends State<TimeTableScreen> {
  List<Pair> days;
  _TimeTableState(this.days);

  void startAddNewEvent(BuildContext cxt) {
    showModalBottomSheet(
        context: cxt,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewEvent(addNewEvent),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _delete(String id) {
      if(!mounted) return;
      setState(() {
        for (int i = 0; i < 7; i++) {
          widget.days[i].events.removeWhere((x) => x.id == id);
        }
      });
  }

  int compareTime(Event a, Event b) {
    double timeA = a.time.hour + a.time.minute / 60.0;
    double timeB = b.time.hour + b.time.minute / 60.0;
    return timeA > timeB ? 1 : -1;
  }

  void addNewEvent(String title, TimeOfDay time, String place, int day) {
    setState(() {
      widget.days[day]
          .events
          .add(Event(DateTime.now().toString(), title, time, place, _delete));
      widget.days[day].events.sort((a, b) => compareTime(a, b));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timetable'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => startAddNewEvent(context))
          ],
        ),
        body: ListView.builder(
            itemBuilder: (ctx, index) {
              return Day(widget.days[index].weekday, days[index].events);
            },
            itemCount: widget.days.length));
  }
}

class Pair {
  String weekday;
  List<Event> events;
  Pair(this.weekday, this.events);
}
