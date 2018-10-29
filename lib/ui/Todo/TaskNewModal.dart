import 'package:flutter/material.dart';

import 'package:playground/ui/styles/C_TextStyle.dart';

class TaskNewModal extends StatelessWidget {
  TaskNewModal({this.onSubmit});

  final titleController = TextEditingController();
  final onSubmit;

  void handleAddTask(context) {
    String title = titleController.text;
    onSubmit(title);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 100.0,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: titleController,
                autofocus: true,
              ),
            ),
            RaisedButton(
              onPressed: () => handleAddTask(context),
              child: Text('Create!'),
            ),
          ],
        ),
      ),
    );
  }
}
