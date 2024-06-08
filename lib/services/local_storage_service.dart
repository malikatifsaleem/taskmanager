// lib/services/local_storage_service.dart
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';

class LocalStorageService {
  Future<void> saveTasks(List<Task> tasks) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encodedData = Task.encode(tasks);
      await prefs.setString('tasks', encodedData);
      print('Tasks saved to local storage: $encodedData');
    } catch (error) {
      print('Error saving tasks to local storage: $error');
    }
  }

  Future<List<Task>> loadTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? tasksString = prefs.getString('tasks');
      if (tasksString != null) {
        return Task.decode(tasksString);
      }
      return [];
    } catch (error) {
      print('Error loading tasks from local storage: $error');
      return [];
    }
  }

}
