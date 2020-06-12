import 'package:flutter/material.dart';

import 'package:actual/models/Event.dart';

class EventWidget extends StatelessWidget {
  final Event currentEvent;
  final Function deleteEvent;

  EventWidget(this.currentEvent, this.deleteEvent);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(this.currentEvent.time.format(context)),
      title: Text(this.currentEvent.title,),
      subtitle: Text(this.currentEvent.place),
      trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteEvent(this.currentEvent.id)),
    );
  }
}
