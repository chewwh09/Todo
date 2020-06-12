
import 'package:flutter/material.dart';
import '../models/Event.dart';
import '../models/Day.dart';
import '../models/NewEvent.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const routeName = '/TimeTableScreen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timetable',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TimetableScreen(title: 'Timetable'),
    );
  }
}

class TimetableScreen extends StatefulWidget {
  TimetableScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<TimetableScreen> {
 
      static List<Pair> days = 
      [Pair("Monday", []),
       Pair("TuesDay", []),
       Pair("Wednesday", []),
       Pair("Thursday", []),
       Pair("Friday", []),
       Pair("Saturday", []),
       Pair("Sunday", []),
     ];

  
  void startAddNewEvent(BuildContext cxt) {
      showModalBottomSheet(
        context: cxt,
        builder: (_) {
          return GestureDetector(
            onTap:(){},
            child: NewEvent(addNewEvent),
            behavior: HitTestBehavior.opaque,
            );
        }
        );
  }
  void _delete(String id) {
    setState(() {
      for(int i = 0; i < 7;i ++ ) {
        days[i].events.removeWhere((x) => x.id == id);
      }
    });
  }
  int compareTime(Event a, Event b) {
    double timeA = a.time.hour + a.time.minute/60.0;
     double timeB = b.time.hour + b.time.minute/60.0;
     print("...");
    return timeA > timeB ? 1 : -1;
  }
  void addNewEvent(String title, TimeOfDay time, String place, int day) {
    setState(() {
      days[day].events.add(Event(DateTime.now().toString(),title, time , place, _delete));
      days[day].events.sort((a,b) => compareTime(a, b));
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
           onPressed: () => startAddNewEvent(context))
        ],
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index){
            return Day(days[index].weekday, days[index].events);
          },
          itemCount: days.length
      )
    );
  }
}
class Pair {
  String weekday;
  List<Event> events;
  Pair(this.weekday, this.events);

}
