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
