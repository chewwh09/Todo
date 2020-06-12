//NOT USING ANYMORE BECAUSE IM USING SILVER



// import 'package:flutter/material.dart';

// import '../models/ToDo.dart';
// import '../widgets/ToDoItem.dart';

// class ToDoList extends StatefulWidget {
//   final List<ToDo> toDo;
//   final Function removeItem;
//   final Function completed;

//   ToDoList(this.toDo, this.removeItem, this.completed);

//   @override
//   _ToDoListState createState() => _ToDoListState();
// }

// class _ToDoListState extends State<ToDoList> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 380,
//         child: widget.toDo.isEmpty
//             ? Text('The list is empty')
//             : ListView.builder(
//                 itemCount: widget.toDo.length,
//                 itemBuilder: (ctx, i) {
//                   return Dismissible(
//                       direction: DismissDirection.endToStart,
//                       background: Container(
//                         alignment: Alignment.centerRight,
//                         padding: EdgeInsets.only(right: 20),
//                         margin:
//                             EdgeInsets.symmetric(horizontal: 15, vertical: 4),
//                         color: Theme.of(context).errorColor,
//                         child: Icon(
//                           Icons.delete,
//                           color: Colors.white,
//                           size: 40,
//                         ),
//                       ),
//                       key: ValueKey(widget.toDo[i].id),
//                       onDismissed: (direction) {
//                         setState(() {
//                           widget.toDo.removeAt(i);
//                         });
//                       },
//                       child: ToDoItem(widget.toDo[i], widget.removeItem, widget.completed));
//                 }));
//   }
// }


