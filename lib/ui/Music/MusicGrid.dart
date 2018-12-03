import 'package:flutter/material.dart';

import 'package:playground/ui/Music/MusicGridItem.dart';
import 'package:playground/ui/Music/MusicDetailPage.dart';
import 'package:playground/models/Music.dart';

class MusicGrid extends StatelessWidget {
  MusicGrid({this.musics});

  List<Music> musics = <Music>[];

  @override
  Widget build(BuildContext context) {
    if (musics.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: musics.length,
      itemBuilder: (context, index) {
        Music music = musics[index];
        return GestureDetector(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicDetailPage(music: music),
                ),
              ),
          child: MusicGridItem(music: music),
        );
      },
    );
  }
}
