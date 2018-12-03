import 'package:flutter/material.dart';
import 'package:playground/ui/Todo/TodoPage.dart';
import 'package:playground/ui/Music/MusicPage.dart';
import 'package:playground/ui/common/BottomTabBar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tcontroller;

  @override
  void initState() {
    _tcontroller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Playground'),
        ),
        body: TabBarView(
          controller: _tcontroller,
          children: [
            TodoPage(),
            MusicPage(),
          ],
        ),
        bottomNavigationBar: BottomTabBar(controller: _tcontroller),
      ),
    );
  }
}
