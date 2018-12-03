import 'dart:async';

import 'package:flutter/material.dart';

import 'package:playground/ui/Music/MusicGrid.dart';
import 'package:playground/models/Music.dart';
import 'package:playground/services/MusicService.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => new _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  List<Music> musics = <Music>[];

  @override
  void initState() {
    final musicService = MusicService();
    final Future<List<Music>> results = musicService.search();
    results.then((r) => setState(() {
          musics = r;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: MusicGrid(musics: musics),
    );
  }
}
