import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/src/Model/Post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String url = 'https://jsonplaceholder.typicode.com/posts';

  static List parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List posts = list.map((model) => Post.fromjson(model)).toList();
    return posts;
  }

  static Future<Future<List>> fetchPosts({int page = 1}) async {
    final response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      var future = compute(parsePost, response.body);
      return future;
    } else if (response.statusCode == 404) {
      throw Exception('No Found');
    } else {
      throw Exception("Can't get post");
    }
  }
}
