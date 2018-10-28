import 'package:flutter/material.dart';

import 'package:playground/models/Todo.dart';

class TodoPercentIndicator extends StatelessWidget {
  TodoPercentIndicator({this.todo});

  Todo todo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: todo.percentComplete(),
            backgroundColor: Colors.grey.withAlpha(50),
            valueColor: AlwaysStoppedAnimation<Color>(todo.color),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 8.0)),
        Text((todo.percentComplete() * 100).round().toString() + '%'),
      ],
    );
  }
}
