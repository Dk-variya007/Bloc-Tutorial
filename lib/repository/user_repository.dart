import 'dart:convert';
import 'dart:io';

import 'package:bloc_state_management/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static Future<List<UserModel>> getData() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        return data.map((e) => UserModel.fromJson(e)).toList();
        //return data.map((e) => UserModel(name: e['name'])).toList();
      }
    } on SocketException {
      throw Exception("error is occurred");
    }
    throw Exception("error is  Occurred");
  }
}
