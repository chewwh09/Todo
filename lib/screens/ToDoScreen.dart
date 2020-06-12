import 'package:flutter/material.dart';

import '../widgets/ToDoList/AppDrawer.dart';
import '../models/ToDo.dart';
import '../widgets/ToDoList/NewToDoItem.dart';
import '../widgets/ToDoList/PieChartDiagram.dart';
import '../widgets/ToDoList/ToDoItem.dart';

class ToDoScreen extends StatefulWidget {
  static const routeName = '/todo-screen';

  final List<ToDo> _userToDo;
  final List<ToDo> _completedTask;

  ToDoScreen(this._userToDo, this._completedTask);

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  void _addNewToDoItem(String title, DateTime deadline) {
    final item =
        ToDo(id: DateTime.now().toString(), title: title, date: deadline);

    setState(() {
      widget._userToDo.add(item);
      widget._userToDo.sort((x, y) => x.date.compareTo(y.date));
    });
  }

  void _startAddNewToDoItem(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewToDoItem(_addNewToDoItem);
        });
  }

  void _removeItem(String id) {
    setState(() {
      widget._userToDo.removeWhere((item) => item.id == id);
    });
  }

  void _addToCompletedTask(ToDo completed) {
    setState(() {
      widget._completedTask.add(completed);
    });
  }

  @override
  void initState() {
    widget._userToDo.removeWhere(
        (element) => element.date.difference(DateTime.now()).inDays == 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        child: Icon(Icons.add),
        onPressed: () => _startAddNewToDoItem(context),
        backgroundColor: Colors.greenAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            iconTheme: new IconThemeData(color: Colors.green, size: 20),
            centerTitle: false,
            forceElevated: false,
            expandedHeight: 250,
            floating: true,
            pinned: false,
            title: Text(
              'To-Do List!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    child: Image.asset(
                      'assets/images/ToDoScreenAppBar.jpg',
                      fit: BoxFit.cover, //can be Boxfit.fill
                    ),
                  )),
                  Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: PieChartDiagram(
                          widget._completedTask, widget._userToDo, UniqueKey()))
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            for (var i = 0; i < widget._userToDo.length; i++)
              ToDoItem(widget._userToDo[i], _removeItem, _addToCompletedTask)
          ]))
        ],
      ),
    );
  }
}