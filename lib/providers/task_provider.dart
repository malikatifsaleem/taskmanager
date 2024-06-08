import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/local_storage_service.dart';
import '../services/task_service.dart';

class TaskProvider with ChangeNotifier {
  TaskService _taskService = TaskService();
  List<Task> _tasks = [];
  int _limit = 10;
  int _skip = 0;
  bool _hasMore = true;
  bool _isLoading = false;
  final LocalStorageService _localStorageService = LocalStorageService();

  TaskProvider() {
    _loadTasksFromLocalStorage();
  }

  List<Task> get tasks => [..._tasks];
  bool get hasMore => _hasMore;
  bool get isLoading => _isLoading;

  Future<void> fetchTasks() async {
    print("Fetching tasks...");
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    if (!_hasMore) return;

    try {
      final fetchedTasks = await _taskService.getTasks(_limit, _skip);
      print("Fetched tasks: ${fetchedTasks.toString()}");

      if (fetchedTasks.length < _limit) {
        _hasMore = false;
      }

      _tasks.addAll(fetchedTasks);
      _skip += _limit;
    } catch (error) {
      print('Error fetching tasks: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadTasksFromLocalStorage() async {
    try {
      _tasks = await _localStorageService.loadTasks();
      notifyListeners();
    } catch (error) {
      print('Error loading tasks from local storage: $error');
    }
  }

  Future<void> _saveTasksToLocalStorage() async {
    try {
      await _localStorageService.saveTasks(_tasks);
    } catch (error) {
      print('Error saving tasks to local storage: $error');
    }
  }

  Future<void> deleteTask(int id) async {
    // await _taskService.deleteTask(id);
    _tasks.removeWhere((task) => task.id == id);
    await _saveTasksToLocalStorage();
    notifyListeners();
  }

  Future<void> updateTaskCompletion(int id, bool completed) async {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex].completed = completed;
      await _saveTasksToLocalStorage();
      notifyListeners();
    }
  }

  void addTask(Task task) {
    _tasks.add(task);
    print("tasks" + _tasks.toString());
    _saveTasksToLocalStorage();
    notifyListeners();
  }
}
