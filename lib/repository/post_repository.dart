import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_state_management/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  static Future<List<PostModel>> getData() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        return data.map((e) {
          return PostModel(
              body: e['body'] as String,
              email: e['email'] as String,
              name: e['name'] as String);
        }).toList();
      }
    } on SocketException {
      throw Exception("Error While Fetching Data");
    } on TimeoutException {
      throw Exception("Error While Fetching Data");
    }
    throw Exception("Error While Fetching Data");
  }
}
