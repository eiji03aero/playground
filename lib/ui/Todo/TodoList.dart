import 'package:flutter/material.dart';
import 'package:playground/ui/Todo/TodoListItem.dart';
import 'package:playground/ui/Todo/TodoDetailPage.dart';

import 'package:playground/models/Todo.dart';

class TodoList extends StatelessWidget {
  final todos;

  TodoList({this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        Todo todo = todos[index];
        return GestureDetector(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoDetailPage(todo: todo),
                ),
              ),
          child: TodoListItem(todo: todo),
        );
      },
    );
  }
}
