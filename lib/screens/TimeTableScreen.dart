import 'package:flutter/material.dart';

import '../widgets/TimeTable/Event.dart';
import '../widgets/TimeTable/Day.dart';
import '../widgets/TimeTable/NewEvent.dart';
import '../models/Event.dart';

class TimeTableScreen extends StatefulWidget {
  static const routeName = '/TimeTableScreen';
  final days;
  TimeTableScreen(this.days);
  @override
  _TimeTableState createState() => _TimeTableState();

}

class _TimeTableState extends State<TimeTableScreen> {
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
      setState(() {
        for (int i = 0; i < 7; i++) {
          widget.days[i].events.removeWhere((x) => x.id == id);
        }
      });
  }

  int compareTime(EventWidget a, EventWidget b) {
    double timeA = a.currentEvent.time.hour + a.currentEvent.time.minute / 60.0;
    double timeB = b.currentEvent.time.hour + b.currentEvent.time.minute / 60.0;
    return timeA > timeB ? 1 : -1;
  }

  void addNewEvent(String title, TimeOfDay time, String place, int day) {
    setState(() {
      widget.days[day]
          .events
          .add(Event(DateTime.now().toString(), title, time, place));
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
              return Day(widget.days[index].weekday, widget.days[index].events, _delete);
            },
            itemCount: widget.days.length));
  }
}

class Pair {
  String weekday;
  List<Event> events;
  Pair(this.weekday, this.events);
}
