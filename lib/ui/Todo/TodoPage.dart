import 'package:flutter/material.dart';
import 'package:playground/ui/Todo/TodoList.dart';

import 'package:playground/models/Todo.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => new _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos;

  @override
  void initState() {
    todos = defaultTodos;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TodoList(todos: todos),
    );
  }
}
