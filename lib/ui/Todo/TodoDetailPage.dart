import 'package:flutter/material.dart';
import 'package:playground/ui/Todo/TodoPercentIndicator.dart';
import 'package:playground/ui/Todo/TaskNewModal.dart';

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

  void startAddingTask(ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return TaskNewModal(onSubmit: handleAddTask);
      },
    );
  }

  void handleAddTask(String title) {
    setState(() {
      todo.addTask(title: title);
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
      height: 250.0,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: todo.color,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(todo.icon, size: 60.0, color: Colors.white),
                Text(todo.title,
                    style: TextStyle(fontSize: 24.0, color: Colors.white)),
              ],
            ),
          ),
          Container(
            color: Colors.white.withAlpha(180),
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
              Text(todo.explainCompleted()),
              TodoPercentIndicator(todo: todo),
            ]),
          ),
        ],
      ),
    );

    final detailPageContentButtons = Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                startAddingTask(context);
              },
              color: Colors.blue,
              child:
                  Text('Add new Task', style: TextStyle(color: Colors.white)),
            ),
            Padding(padding: EdgeInsets.only(left: 32.0)),
            RaisedButton(
              onPressed: () {
                print('domo');
              },
              color: Colors.orange,
              child:
                  Text('View history', style: TextStyle(color: Colors.white)),
            ),
          ],
        ));

    final detailPageContent = Column(
      children: [
        detailPageContentHeader,
        detailPageContentButtons,
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: todo.tasks.length,
            itemBuilder: (context, index) {
              Task task = todo.tasks[index];
              return ListTile(
                leading: Checkbox(
                  value: task.completed,
                  onChanged: (cb) => handleToggleCompleted(task, cb),
                ),
                title: Text(task.title),
              );
            },
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
