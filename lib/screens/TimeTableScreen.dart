import 'package:flutter/material.dart';

import '../widgets/Event.dart';
import '../widgets/Day.dart';
import '../models/NewEvent.dart';

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
  @override
  void requestRebuild() {
  if(mounted) setState(() {});
}

  void _delete(String id) {
      setState(() {
        for (int i = 0; i < 7; i++) {
          widget.days[i].events.removeWhere((x) => x.id == id);
        }
      });
      setState(() {
        
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
              return Day(widget.days[index].weekday, widget.days[index].events);
            },
            itemCount: widget.days.length));
  }
}

class Pair {
  String weekday;
  List<Event> events;
  Pair(this.weekday, this.events);
}
