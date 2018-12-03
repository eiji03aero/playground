import 'package:flutter/material.dart';

import 'package:playground/models/Music.dart';

class MusicDetailPage extends StatelessWidget {
  MusicDetailPage({this.music});

  Music music;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(music.artworkUrl100),
            Text(music.artistName),
            Text(music.collectionName),
            Text(music.artistViewUrl),
          ],
        ),
      ),
    );
  }
}
