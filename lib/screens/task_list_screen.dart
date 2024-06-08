import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/screens/add_task_screen.dart';
import 'package:taskmanager/services/local_storage_service.dart';
import '../models/task_model.dart';
import '../providers/task_provider.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task>? localStorage;

  @override
  void initState() {
    super.initState();
    _loadTasksFromLocalStorage();
  }

  Future<void> _loadTasksFromLocalStorage() async {
    localStorage = await LocalStorageService().loadTasks();
    setState(() {}); // Trigger a rebuild after loading tasks
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks List'),
      ),
      body: taskProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : taskProvider.tasks.isEmpty
              ? Center(
                  child: Text('No tasks available.'),
                )
              : ListView.builder(
                  itemCount: taskProvider.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskProvider.tasks[index];
                    return ListTile(
                      title: Text(task.todo ?? 'No title'),
                      leading: Checkbox(
                        value: task.completed,
                        onChanged: (value) {
                          taskProvider.updateTaskCompletion(task.id, value!);
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          taskProvider.deleteTask(task.id);
                        },
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );

          // Navigate to the screen for adding a new task
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
