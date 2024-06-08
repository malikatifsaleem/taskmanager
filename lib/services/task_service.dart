import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class TaskService {
  static const String baseUrl = 'https://dummyjson.com/todos';

  Future<List<Task>> getTasks(int limit, int skip) async {
    print("object");
    final response =
        await http.get(Uri.parse('$baseUrl?limit=$limit&skip=$skip'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Task> tasks =
          (data['todos'] as List).map((json) => Task.fromJson(json)).toList();
      return tasks;
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
