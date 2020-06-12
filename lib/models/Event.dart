import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  final String id;
  final String title;
  final TimeOfDay time;
  final String place;
  final Function deleteEvent;

  Event(this.id ,this.title, this.time, this.place, this.deleteEvent);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(this.time.format(context)),
      title: Text(this.title),
      subtitle: Text(this.place),
      trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: ()=> deleteEvent(this.id)),
                    );
        
      }
      

}