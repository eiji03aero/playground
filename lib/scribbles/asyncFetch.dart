import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;

  Photo({this.id, this.title, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');
  return compute(parsePhotos, response.body);
}

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => new _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photo>>(
      future: fetchPhotos(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return snapshot.hasData
            ? PhotosList(photos: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}
