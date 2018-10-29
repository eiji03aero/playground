import 'dart:math' as math;
import 'package:flutter/material.dart';

class Todo {
  Todo({this.title, this.color, this.tasks, this.icon}) {
    this.id = math.Random().nextInt(10000);
  }

  int id;
  String title;
  Color color;
  List<Task> tasks;
  IconData icon;

  addTask({title}) {
    tasks.insert(0, Task(title: title));
  }

  String explainCompleted() {
    return "${completedTasksCount()}/${tasks.length}";
  }

  int completedTasksCount() {
    int completedTasks = 0;
    tasks.forEach((task) {
      if (task.completed) {
        completedTasks++;
      }
    });
    return completedTasks;
  }

  double percentComplete() => completedTasksCount() / tasks.length;
}

class Task {
  Task({this.title, this.completed: false}) {
    this.id = math.Random().nextInt(10000);
  }

  int id;
  String title;
  bool completed;

  setCompleted(value) {
    completed = value;
  }
}

List<Todo> defaultTodos = [
  Todo(
    title: 'House',
    color: Colors.blue,
    icon: Icons.home,
    tasks: [
      Task(title: 'Clean house', completed: false),
      Task(title: 'Study a little bit', completed: true),
      Task(title: 'Goto city hall', completed: true),
      Task(title: 'Pay tax', completed: true),
      Task(title: 'Buy vacuum machine', completed: true),
      Task(title: 'Invite friends to party', completed: true),
      Task(title: 'Say hi to neighbors', completed: true),
      Task(title: 'Feed cats', completed: true),
      Task(title: 'Sleep well', completed: true),
      Task(title: 'Send mail to mom', completed: true),
      Task(title: 'Learn hi-five', completed: true),
      Task(title: 'Read cook book', completed: true),
    ],
  ),
  Todo(
    title: 'Work',
    color: Colors.green,
    icon: Icons.work,
    tasks: [
      Task(title: 'Send email', completed: true),
      Task(title: 'Sell at least ten products'),
    ],
  ),
  Todo(
    title: 'Love',
    color: Colors.pink,
    icon: Icons.favorite,
    tasks: [
      Task(title: 'Take your gf to date', completed: true),
      Task(title: 'Buy marriage ring', completed: true),
    ],
  ),
  Todo(
    title: 'Health',
    color: Colors.orange,
    icon: Icons.accessibility_new,
    tasks: [
      Task(title: 'Go for a run', completed: true),
      Task(title: 'Eat vegitables'),
      Task(title: 'Beg for healthy food'),
    ],
  ),
  Todo(
    title: 'Hobby',
    color: Colors.purple,
    icon: Icons.adb,
    tasks: [
      Task(title: 'Play with laptop'),
    ],
  ),
];
