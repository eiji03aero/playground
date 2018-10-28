import 'package:flutter/material.dart';

import 'package:playground/models/Todo.dart';

class TodoListItem extends StatelessWidget {
  TodoListItem({this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final cardHeader = Container(
      child: Row(
        children: [
          Icon(todo.icon, color: Colors.white),
          Padding(padding: EdgeInsets.only(left: 8.0)),
          Text(
            todo.title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: todo.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
    );

    final cardBodyProgressBar = Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: todo.percentComplete(),
            backgroundColor: Colors.grey.withAlpha(50),
            valueColor: AlwaysStoppedAnimation<Color>(todo.color),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 8.0)),
        Text((todo.percentComplete() * 100).round().toString() + "%"),
      ],
    );

    final cardBody = Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('${todo.tasks.length} tasks'),
              ),
              Padding(padding: EdgeInsets.only(top: 4.0)),
              cardBodyProgressBar,
            ],
          ),
        ),
      ),
    );

    return Container(
      height: 100.0,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 12.0),
          ),
        ],
      ),
      child: Column(
        children: [
          cardHeader,
          cardBody,
        ],
      ),
    );
  }
}
