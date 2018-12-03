import 'package:flutter/material.dart';

import 'package:playground/models/Music.dart';

class MusicGridItem extends StatelessWidget {
  MusicGridItem({this.music});

  Music music;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            music.artworkUrl100,
          ),
          Text(music.collectionName maxLines: 1),
        ],
      ),
    );
  }
}
