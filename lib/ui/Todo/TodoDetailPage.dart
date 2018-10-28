import 'package:flutter/material.dart';
import 'package:playground/ui/Todo/TodoPercentIndicator.dart';

import 'package:playground/models/Todo.dart';

class TodoDetailPage extends StatefulWidget {
  TodoDetailPage({this.todo});

  Todo todo;

  @override
  _TodoDetailPageState createState() => new _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  Todo todo;

  @override
  void initState() {
    todo = widget.todo;
  }

  void handleToggleCompleted(Task task, bool value) {
    setState(() {
      task.setCompleted(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final detailTopToolBar = Container(
      color: Colors.grey.withAlpha(50),
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(color: Colors.white),
    );

    final detailPageContentHeader = Container(
      height: 200.0,
      color: todo.color,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(todo.icon, size: 60.0, color: Colors.white),
          Text(todo.title,
              style: TextStyle(fontSize: 24.0, color: Colors.white)),
        ],
      ),
    );

    final detailPageContentDescription = Container(
      color: Colors.white.withAlpha(50),
      padding: EdgeInsets.all(16.0),
      child: Column(children: [
        Text(todo.explainCompleted()),
        TodoPercentIndicator(todo: todo),
      ]),
    );

    final detailPageContent = Column(
      children: [
        detailPageContentHeader,
        detailPageContentDescription,
        Expanded(
          child: ListView(
            children: todo.tasks.map((task) {
              return ListTile(
                leading: Checkbox(
                  value: task.completed,
                  onChanged: (cb) => handleToggleCompleted(task, cb),
                ),
                title: Text(task.id.toString() + ' ' + task.title),
              );
            }).toList(),
          ),
        ),
      ],
    );

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            detailPageContent,
            detailTopToolBar,
          ],
        ),
      ),
    );
  }
}
