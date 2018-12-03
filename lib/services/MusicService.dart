import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'package:playground/models/Music.dart';

class ResponseResult {
  final int resultCount;
  final List<dynamic> results;

  ResponseResult({this.resultCount, this.results});

  factory ResponseResult.fromJson(Map<String, dynamic> json) {
    return ResponseResult(
      resultCount: json['resultCount'] as int,
      results: json['results'] as List<dynamic>,
    );
  }
}

class MusicService {
  Future<List<Music>> search() async {
    final client = http.Client();
    /* https://itunes.apple.com/search?term=${keyword}&country=jp&media=music&attribute=${attribute}&limit=${this.limit}&offset=${this.limit * page} */
    final response = await client.get(
        'https://itunes.apple.com/search?term=uver&country=jp&media=music');
    return compute(parseResult, response.body);
  }
}

List<Music> parseResult(String responseBody) {
  assert(responseBody is String);
  final Map<String, dynamic> parsed = json.decode(responseBody);
  final ResponseResult responseResult = ResponseResult.fromJson(parsed);
  return responseResult.results
      .map<Music>((json) => Music.fromJson(json))
      .toList();
}
