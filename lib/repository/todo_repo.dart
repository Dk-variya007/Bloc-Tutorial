import 'dart:convert';

import 'package:bloc_state_management/model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  static final List<TodoModel> todos = [];

  static Future<List<TodoModel>> fetchTodo() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (int i = 0; i < data.length; i++) {
          TodoModel todo = TodoModel.fromJson(data[i] as Map<String, dynamic>);
          todos.add(todo);
        }
        return todos;
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }
}
