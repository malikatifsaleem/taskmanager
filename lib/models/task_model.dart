import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'task_model.g.dart';

@JsonSerializable()
class TaskResponse {
  List<Task> todos;
  int total;
  int skip;
  int limit;

  TaskResponse(
      {required this.todos,
      required this.total,
      required this.skip,
      required this.limit});

  factory TaskResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TaskResponseToJson(this);
}

@JsonSerializable()
class Task {
  int id;
  String? todo;
  bool completed;
  int? userId;

  Task({required this.id, this.todo, required this.completed, this.userId});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
  static List<Task> decode(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
          .map<Task>((item) => Task.fromJson(item as Map<String, dynamic>))
          .toList();

  static String encode(List<Task> tasks) => json.encode(
        tasks.map<Map<String, dynamic>>((task) => task.toJson()).toList(),
      );
}
