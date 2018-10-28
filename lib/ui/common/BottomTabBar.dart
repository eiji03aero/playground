import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  final TabController controller;

  BottomTabBar({this.controller});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: TabBar(
        controller: controller,
        tabs: [
          Tab(
            icon: Icon(Icons.developer_board),
            text: 'Todos',
          ),
        ],
      ),
    );
  }
}
